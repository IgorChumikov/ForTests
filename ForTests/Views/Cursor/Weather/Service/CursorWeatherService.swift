import Foundation

enum CursorWeatherNetworkError: Error, LocalizedError {
    case invalidURL
    case badResponse
    case decodingError

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Некорректный адрес запроса."
        case .badResponse: return "Сервер вернул ошибку."
        case .decodingError: return "Не удалось разобрать ответ."
        }
    }
}

protocol CursorWeatherServiceProtocol: Sendable {
    func fetchWeather(for city: CursorCity) async throws -> CursorCurrentWeather
}

final class CursorWeatherService: CursorWeatherServiceProtocol {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

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
