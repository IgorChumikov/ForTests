import Foundation

// MARK: - API

struct CursorWeatherResponse: Decodable {
    let currentWeather: CursorCurrentWeather

    enum CodingKeys: String, CodingKey {
        case currentWeather = "current_weather"
    }
}

struct CursorCurrentWeather: Decodable {
    let temperature: Double
    let windspeed: Double
    let weathercode: Int
}

// MARK: - Domain

struct CursorCity: Identifiable, Equatable, Sendable {
    let id: String
    let name: String
    let latitude: Double
    let longitude: Double

    static let presets: [CursorCity] = [
        CursorCity(id: "moscow", name: "Москва", latitude: 55.7512, longitude: 37.6184),
        CursorCity(id: "spb", name: "Санкт-Петербург", latitude: 59.9343, longitude: 30.3351),
        CursorCity(id: "kazan", name: "Казань", latitude: 55.7887, longitude: 49.1221),
        CursorCity(id: "sochi", name: "Сочи", latitude: 43.6028, longitude: 39.7342)
    ]
}

struct CursorWeatherUIModel: Equatable {
    let cityName: String
    let temperature: String
    let windSpeed: String
    let conditionDescription: String
    let systemIconName: String

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
