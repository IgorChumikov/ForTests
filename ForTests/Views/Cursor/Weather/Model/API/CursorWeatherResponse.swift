import Foundation

// MARK: - CursorWeatherResponse

/// Корневой ответ Open-Meteo с блоком текущей погоды.
struct CursorWeatherResponse: Decodable {
    /// Текущие погодные условия в точке запроса.
    let currentWeather: CursorCurrentWeather

    // MARK: - CodingKeys

    enum CodingKeys: String, CodingKey {
        case currentWeather = "current_weather"
    }
}
