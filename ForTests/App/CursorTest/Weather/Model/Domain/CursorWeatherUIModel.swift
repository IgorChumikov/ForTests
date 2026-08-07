import Foundation

// MARK: - CursorWeatherUIModel

/// Модель погоды, подготовленная для отображения в SwiftUI.
struct CursorWeatherUIModel: Equatable {
    /// Название выбранного города.
    let cityName: String
    /// Температура с символом градуса.
    let temperature: String
    /// Скорость ветра с единицей измерения.
    let windSpeed: String
    /// Краткое описание погоды на русском.
    let conditionDescription: String
    /// Имя SF Symbol для иконки состояния.
    let systemIconName: String

    // MARK: - Initialization

    /// Собирает UI-модель из доменного города и ответа API.
    init(city: CursorCity, weather: CursorCurrentWeather) {
        cityName = city.name
        temperature = "\(Int(weather.temperature.rounded()))°"
        windSpeed = "\(Int(weather.windspeed.rounded())) км/ч"

        switch weather.weathercode {
        case 0:
            conditionDescription = "Ясно"
            systemIconName = "sun.max.fill"
        case 1...3:
            conditionDescription = "Облачно"
            systemIconName = "cloud.sun.fill"
        case 45, 48:
            conditionDescription = "Туман"
            systemIconName = "cloud.fog.fill"
        case 51...67, 80...82:
            conditionDescription = "Дождь"
            systemIconName = "cloud.rain.fill"
        case 71...77, 85, 86:
            conditionDescription = "Снег"
            systemIconName = "cloud.snow.fill"
        case 95...99:
            conditionDescription = "Гроза"
            systemIconName = "cloud.bolt.rain.fill"
        default:
            conditionDescription = "Переменная облачность"
            systemIconName = "cloud.fill"
        }
    }
}
