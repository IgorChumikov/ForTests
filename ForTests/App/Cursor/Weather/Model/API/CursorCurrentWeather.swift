import Foundation

// MARK: - CursorCurrentWeather

/// Снимок текущей погоды из API Open-Meteo.
struct CursorCurrentWeather: Decodable {
    /// Температура воздуха, °C.
    let temperature: Double
    /// Скорость ветра, км/ч.
    let windspeed: Double
    /// Код погоды WMO для маппинга в описание и иконку.
    let weathercode: Int
}
