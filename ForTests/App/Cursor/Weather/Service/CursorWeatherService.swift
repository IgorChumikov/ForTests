import Foundation

// MARK: - CursorWeatherServiceProtocol

protocol CursorWeatherServiceProtocol: Sendable {
    func fetchWeather(for city: CursorCity) async throws -> CursorCurrentWeather
}

// MARK: - CursorWeatherService

final class CursorWeatherService: CursorWeatherServiceProtocol {

    // MARK: - Private Properties

    private let session: URLSession

    // MARK: - Initialization

    init(session: URLSession = .shared) {
        self.session = session
    }

    // MARK: - CursorWeatherServiceProtocol

    func fetchWeather(for city: CursorCity) async throws -> CursorCurrentWeather {
        var components = URLComponents(string: "https://api.open-meteo.com/v1/forecast")
        components?.queryItems = [
            URLQueryItem(name: "latitude", value: String(city.latitude)),
            URLQueryItem(name: "longitude", value: String(city.longitude)),
            URLQueryItem(name: "current_weather", value: "true")
        ]

        guard let url = components?.url else {
            throw CursorWeatherNetworkError.invalidURL
        }

        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw CursorWeatherNetworkError.badResponse
        }

        do {
            return try JSONDecoder().decode(CursorWeatherResponse.self, from: data).currentWeather
        } catch {
            throw CursorWeatherNetworkError.decodingError
        }
    }
}
