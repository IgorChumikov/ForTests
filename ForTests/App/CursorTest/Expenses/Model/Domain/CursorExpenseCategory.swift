import Foundation

// MARK: - CursorExpenseCategory

/// Категория расхода для фильтрации и группировки.
struct CursorExpenseCategory: Identifiable, Equatable, Hashable, Sendable, Codable {
    /// Уникальный идентификатор категории.
    let id: String
    /// Название категории.
    let name: String
    /// Иконка SF Symbol.
    let systemIconName: String

    // MARK: - Presets

    /// Все категории, включая «Все».
    static let presets: [CursorExpenseCategory] = [
        CursorExpenseCategory(id: "all", name: "Все", systemIconName: "square.grid.2x2.fill"),
        CursorExpenseCategory(id: "food", name: "Еда", systemIconName: "fork.knife"),
        CursorExpenseCategory(id: "transport", name: "Транспорт", systemIconName: "car.fill"),
        CursorExpenseCategory(id: "shopping", name: "Покупки", systemIconName: "bag.fill"),
        CursorExpenseCategory(id: "other", name: "Другое", systemIconName: "ellipsis.circle.fill")
    ]

    /// Категории без пункта «Все» — для сохранения расхода.
    static let spendCategories: [CursorExpenseCategory] = Array(presets.dropFirst())
}
