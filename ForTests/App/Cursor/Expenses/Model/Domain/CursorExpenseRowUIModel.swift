import Foundation

// MARK: - CursorExpenseRowUIModel

/// Строка расхода для списка на экране.
struct CursorExpenseRowUIModel: Identifiable, Equatable {
    /// Идентификатор записи.
    let id: UUID
    /// Заголовок.
    let title: String
    /// Отформатированная сумма.
    let amountText: String
    /// Название категории.
    let categoryName: String
    /// Иконка категории.
    let systemIconName: String
    /// Дата в коротком формате.
    let dateText: String
}
