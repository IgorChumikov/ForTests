import Foundation

// MARK: - CursorExpensesSummaryUIModel

/// Сводка расходов для выбранной категории.
struct CursorExpensesSummaryUIModel: Equatable {
    /// Название активного фильтра.
    let filterTitle: String
    /// Иконка активного фильтра.
    let systemIconName: String
    /// Общая сумма.
    let totalText: String
    /// Количество записей.
    let expenseCountText: String
    /// Строки списка.
    let rows: [CursorExpenseRowUIModel]
}
