import Foundation

// MARK: - CursorCity

/// Город из предустановленного списка с координатами для запроса.
struct CursorCity: Identifiable, Equatable, Sendable {
    /// Уникальный идентификатор города.
    let id: String
    /// Отображаемое название.
    let name: String
    /// Широта.
    let latitude: Double
    /// Долгота.
    let longitude: Double

    // MARK: - Presets

    /// Города, доступные на экране выбора.
    static let presets: [CursorCity] = [
        CursorCity(id: "moscow", name: "Москва", latitude: 55.7512, longitude: 37.6184),
        CursorCity(id: "spb", name: "Санкт-Петербург", latitude: 59.9343, longitude: 30.3351),
        CursorCity(id: "kazan", name: "Казань", latitude: 55.7887, longitude: 49.1221),
        CursorCity(id: "sochi", name: "Сочи", latitude: 43.6028, longitude: 39.7342)
    ]
}
