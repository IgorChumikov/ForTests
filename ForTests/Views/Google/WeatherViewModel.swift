import Foundation
import Combine

enum WeatherViewState: Equatable {
    case idle
    case loading
    case success(WeatherUIModel)
    case error(String)
}

@MainActor
final class WeatherViewModel: ObservableObject {
    @Published private(set) var state: WeatherViewState = .idle
    
    private let weatherService: WeatherServiceProtocol
    private let moscowLat = 55.7512
    private let moscowLon = 37.6184
    
    // Внедрение зависимостей (Dependency Injection) для легкого тестирования
    init(weatherService: WeatherServiceProtocol = WeatherService()) {
        self.weatherService = weatherService
    }
    
    func fetchWeather() async {
        state = .loading
        
        do {
            let currentWeather = try await weatherService.fetchWeather(lat: moscowLat, lon: moscowLon)
            let uiModel = WeatherUIModel(from: currentWeather)
            // Искусственная задержка для плавности UI (опционально)
            try? await Task.sleep(nanoseconds: 500_000_000)
            state = .success(uiModel)
        } catch {
            state = .error(error.localizedDescription)
        }
    }
}
