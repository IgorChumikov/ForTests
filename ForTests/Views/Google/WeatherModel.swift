import Foundation

// MARK: - API Response Models
struct WeatherResponse: Decodable {
    let currentWeather: CurrentWeather
    
    enum CodingKeys: String, CodingKey {
        case currentWeather = "current_weather"
    }
}

struct CurrentWeather: Decodable {
    let temperature: Double
    let windspeed: Double
    let weathercode: Int
}

// MARK: - Domain/UI Model
struct WeatherUIModel: Equatable {
    let temperature: String
    let conditionDescription: String
    let systemIconName: String
    
    init(from response: CurrentWeather) {
        self.temperature = "\(Int(response.temperature.rounded()))°C"
        
        switch response.weathercode {
        case 0:
            self.conditionDescription = "Ясно"
            self.systemIconName = "sun.max.fill"
        case 1...3:
            self.conditionDescription = "Облачно"
            self.systemIconName = "cloud.fill"
        case 45, 48:
            self.conditionDescription = "Туман"
            self.systemIconName = "cloud.fog.fill"
        case 51...67, 80...82:
            self.conditionDescription = "Дождь"
            self.systemIconName = "cloud.rain.fill"
        case 71...77, 85, 86:
            self.conditionDescription = "Снег"
            self.systemIconName = "cloud.snow.fill"
        case 95...99:
            self.conditionDescription = "Гроза"
            self.systemIconName = "cloud.bolt.rain.fill"
        default:
            self.conditionDescription = "Неизвестно"
            self.systemIconName = "cloud"
        }
    }
}
