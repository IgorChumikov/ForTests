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

        if shouldReplaceContent {
            isRefreshing = false
            state = .loading
        } else {
            isRefreshing = true
        }

        do {
            let current = try await weatherService.fetchWeather(for: city)
            guard !Task.isCancelled else { return }

            let model = CursorWeatherUIModel(city: city, weather: current)
            isRefreshing = false
            state = .success(model)
        } catch is CancellationError {
            isRefreshing = false
            return
        } catch {
            guard !Task.isCancelled else { return }
            isRefreshing = false
            state = .error(error.localizedDescription)
        }
    }

    private var hasDisplayedWeather: Bool {
        if case .success = state { return true }
        return false
    }
}
