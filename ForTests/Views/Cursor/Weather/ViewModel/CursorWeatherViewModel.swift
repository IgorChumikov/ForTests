import Foundation

enum CursorWeatherViewState: Equatable {
    case idle
    case loading
    case success(CursorWeatherUIModel)
    case error(String)
}

@MainActor
final class CursorWeatherViewModel: ObservableObject {
    @Published private(set) var state: CursorWeatherViewState = .idle
    @Published private(set) var isRefreshing = false
    @Published var selectedCity: CursorCity

    private let weatherService: CursorWeatherServiceProtocol
    private var fetchTask: Task<Void, Never>?
    private static let minimumRefreshDuration: Duration = .milliseconds(500)

    init(
        city: CursorCity = .presets[0],
        weatherService: CursorWeatherServiceProtocol = CursorWeatherService()
    ) {
        self.selectedCity = city
        self.weatherService = weatherService
    }

    func selectCity(_ city: CursorCity) {
        guard city != selectedCity else { return }
        selectedCity = city
        loadWeather(replacingContent: true)
    }

    func refresh() {
        loadWeather(replacingContent: false)
    }

    func loadWeather(replacingContent: Bool = true) {
        fetchTask?.cancel()
        fetchTask = Task {
            await fetchWeather(replacingContent: replacingContent)
        }
    }

    func fetchWeather(replacingContent: Bool) async {
        guard !Task.isCancelled else { return }

        let city = selectedCity
        let shouldReplaceContent = replacingContent || !hasDisplayedWeather

        let isPullToRefreshStyle = !shouldReplaceContent
        let refreshStarted = isPullToRefreshStyle ? ContinuousClock.now : nil

        if shouldReplaceContent {
            isRefreshing = false
            state = .loading
        } else {
            isRefreshing = true
        }

        do {
            let current = try await weatherService.fetchWeather(for: city)
            guard !Task.isCancelled else { return }

            if let refreshStarted {
                try await ensureMinimumRefreshDuration(since: refreshStarted)
                guard !Task.isCancelled else { return }
            }

            let model = CursorWeatherUIModel(city: city, weather: current)
            isRefreshing = false
            state = .success(model)
        } catch is CancellationError {
            isRefreshing = false
            return
        } catch {
            guard !Task.isCancelled else { return }

            if let refreshStarted {
                try? await ensureMinimumRefreshDuration(since: refreshStarted)
            }

            isRefreshing = false
            state = .error(error.localizedDescription)
        }
    }

    private var hasDisplayedWeather: Bool {
        if case .success = state { return true }
        return false
    }

    private func ensureMinimumRefreshDuration(since start: ContinuousClock.Instant) async throws {
        let elapsed = start.duration(to: .now)
        guard elapsed < Self.minimumRefreshDuration else { return }
        try await Task.sleep(for: Self.minimumRefreshDuration - elapsed)
    }
}
