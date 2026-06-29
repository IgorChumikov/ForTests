import Foundation

// MARK: - CursorExpensesServiceProtocol

protocol CursorExpensesServiceProtocol {
    func fetchExpenses() async throws -> [CursorExpense]
    func saveExpense(_ expense: CursorExpense) async throws -> [CursorExpense]
    func deleteExpense(id: UUID) async throws -> [CursorExpense]
}

// MARK: - CursorExpensesService

final class CursorExpensesService: CursorExpensesServiceProtocol {

    // MARK: - Private Properties

    private let storageKey = "cursor.expenses.items"
    private let userDefaults: UserDefaults

    // MARK: - Initialization

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    // MARK: - CursorExpensesServiceProtocol

    func fetchExpenses() async throws -> [CursorExpense] {
        try await Task.sleep(for: .milliseconds(350))

        guard let data = userDefaults.data(forKey: storageKey) else {
            return seedExpensesIfNeeded()
        }

        do {
            let expenses = try JSONDecoder().decode([CursorExpense].self, from: data)
            return expenses.sorted { $0.createdAt > $1.createdAt }
        } catch {
            throw CursorExpensesStorageError.readFailed
        }
    }

    func saveExpense(_ expense: CursorExpense) async throws -> [CursorExpense] {
        var expenses = try await fetchExpenses()
        expenses.insert(expense, at: 0)
        try persist(expenses)
        return expenses
    }

    func deleteExpense(id: UUID) async throws -> [CursorExpense] {
        var expenses = try await fetchExpenses()
        expenses.removeAll { $0.id == id }
        try persist(expenses)
        return expenses
    }

    // MARK: - Private Methods

    private func persist(_ expenses: [CursorExpense]) throws {
        do {
            let data = try JSONEncoder().encode(expenses)
            userDefaults.set(data, forKey: storageKey)
        } catch {
            throw CursorExpensesStorageError.saveFailed
        }
    }

    private func seedExpensesIfNeeded() -> [CursorExpense] {
        let samples = [
            CursorExpense(title: "Кофе", amount: 320, categoryID: "food"),
            CursorExpense(title: "Метро", amount: 74, categoryID: "transport"),
            CursorExpense(title: "Продукты", amount: 1_840, categoryID: "shopping")
        ]

        try? persist(samples)
        return samples
    }
}
