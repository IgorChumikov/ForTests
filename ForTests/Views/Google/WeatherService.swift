import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case badResponse
    case decodingError
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Некорректный URL адрес."
        case .badResponse: return "Ошибка ответа сервера."
        case .decodingError: return "Ошибка обработки данных."
        case .unknown(let error): return error.localizedDescription
        }
    }
}

protocol WeatherServiceProtocol: Sendable {
    func fetchWeather(lat: Double, lon: Double) async throws -> CurrentWeather
}

final class WeatherService: WeatherServiceProtocol {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchWeather(lat: Double, lon: Double) async throws -> CurrentWeather {
        let urlString = "https://api.open-meteo.com/v1/forecast?latitude=\(lat)&longitude=\(lon)&current_weather=true"
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, 
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.badResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
            return weatherResponse.currentWeather
        } catch {
            throw NetworkError.decodingError
        }
    }
}
