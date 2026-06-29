import Foundation

// MARK: - CursorExpensesStorageError

/// Ошибки локального хранилища расходов.
enum CursorExpensesStorageError: Error, LocalizedError {
    /// Не удалось прочитать сохранённые данные.
    case readFailed
    /// Не удалось сохранить данные.
    case saveFailed

    // MARK: - LocalizedError

    var errorDescription: String? {
        switch self {
        case .readFailed: return "Не удалось загрузить расходы."
        case .saveFailed: return "Не удалось сохранить расходы."
        }
    }
}
