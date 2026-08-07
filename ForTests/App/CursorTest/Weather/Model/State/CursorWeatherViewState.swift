import Foundation

// MARK: - CursorWeatherViewState

/// Состояние экрана погоды для привязки к UI.
enum CursorWeatherViewState: Equatable {
    /// Идёт загрузка или повторный запрос с заменой контента.
    case loading
    /// Данные успешно получены и отображаются.
    case success(CursorWeatherUIModel)
    /// Запрос завершился ошибкой; ассоциированное значение — текст для пользователя.
    case error(String)
}
