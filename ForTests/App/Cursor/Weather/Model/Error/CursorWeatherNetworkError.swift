import Foundation

// MARK: - CursorWeatherNetworkError

/// Ошибки сетевого слоя при запросе погоды.
enum CursorWeatherNetworkError: Error, LocalizedError {
    /// Не удалось собрать URL запроса.
    case invalidURL
    /// HTTP-ответ вне диапазона 2xx.
    case badResponse
    /// Тело ответа не соответствует ожидаемой модели.
    case decodingError

    // MARK: - LocalizedError

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Некорректный адрес запроса."
        case .badResponse: return "Сервер вернул ошибку."
        case .decodingError: return "Не удалось разобрать ответ."
        }
    }
}
