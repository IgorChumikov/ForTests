import Foundation

// MARK: - CursorExpense

/// Запись о расходе в локальном хранилище.
struct CursorExpense: Identifiable, Equatable, Codable, Sendable {
    /// Уникальный идентификатор записи.
    let id: UUID
    /// Заголовок расхода.
    let title: String
    /// Сумма в рублях.
    let amount: Decimal
    /// Идентификатор категории.
    let categoryID: String
    /// Дата создания записи.
    let createdAt: Date

    // MARK: - Initialization

    init(
        id: UUID = UUID(),
        title: String,
        amount: Decimal,
        categoryID: String,
        createdAt: Date = .now
    ) {
        self.id = id
        self.title = title
        self.amount = amount
        self.categoryID = categoryID
        self.createdAt = createdAt
    }
}
