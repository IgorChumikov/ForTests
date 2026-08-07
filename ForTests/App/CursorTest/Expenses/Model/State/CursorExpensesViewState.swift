import Foundation

// MARK: - CursorExpensesViewState

/// Состояние экрана расходов.
enum CursorExpensesViewState: Equatable {
    /// Загрузка данных из хранилища.
    case loading
    /// Данные готовы к отображению.
    case success(CursorExpensesSummaryUIModel)
    /// Ошибка чтения или сохранения.
    case error(String)
}
