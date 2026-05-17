import Foundation

// MARK: - CursorExpensesViewModel

@MainActor
final class CursorExpensesViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var state: CursorExpensesViewState = .loading
    @Published var selectedCategory: CursorExpenseCategory = .presets[0]
    @Published var draftTitle = ""
    @Published var draftAmount = ""
    @Published var selectedSpendCategory: CursorExpenseCategory = CursorExpenseCategory.spendCategories[0]

    // MARK: - Private Properties

    private let expensesService: CursorExpensesServiceProtocol
    private var expenses: [CursorExpense] = []

    // MARK: - Initialization

    init(expensesService: CursorExpensesServiceProtocol = CursorExpensesService()) {
        self.expensesService = expensesService
    }

    // MARK: - Public Methods

    func loadExpenses() {
        Task {
            await reloadExpenses(showLoading: true)
        }
    }

    func selectCategory(_ category: CursorExpenseCategory) {
        guard category != selectedCategory else { return }
        selectedCategory = category
        applyFilter()
    }

    func addExpense() {
        let trimmedTitle = draftTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmedTitle.isEmpty == false else {
            state = .error("Введите название расхода.")
            return
        }

        guard let amount = parseAmount(draftAmount), amount > 0 else {
            state = .error("Введите корректную сумму.")
            return
        }

        Task {
            do {
                let expense = CursorExpense(
                    title: trimmedTitle,
                    amount: amount,
                    categoryID: selectedSpendCategory.id
                )
                expenses = try await expensesService.saveExpense(expense)
                draftTitle = ""
                draftAmount = ""
                applyFilter()
            } catch {
                state = .error(error.localizedDescription)
            }
        }
    }

    func deleteExpense(id: UUID) {
        Task {
            do {
                expenses = try await expensesService.deleteExpense(id: id)
                applyFilter()
            } catch {
                state = .error(error.localizedDescription)
            }
        }
    }

    // MARK: - Private Methods

    private func reloadExpenses(showLoading: Bool) async {
        if showLoading {
            state = .loading
        }

        do {
            expenses = try await expensesService.fetchExpenses()
            applyFilter()
        } catch {
            state = .error(error.localizedDescription)
        }
    }

    private func applyFilter() {
        let filtered = filteredExpenses()
        let category = selectedCategory

        state = .success(
            CursorExpensesSummaryUIModel(
                filterTitle: category.name,
                systemIconName: category.systemIconName,
                totalText: formatAmount(total(for: filtered)),
                expenseCountText: "\(filtered.count) \(expenseCountLabel(filtered.count))",
                rows: filtered.map(makeRow)
            )
        )
    }

    private func filteredExpenses() -> [CursorExpense] {
        guard selectedCategory.id != "all" else { return expenses }
        return expenses.filter { $0.categoryID == selectedCategory.id }
    }

    private func total(for expenses: [CursorExpense]) -> Decimal {
        expenses.reduce(0) { $0 + $1.amount }
    }

    private func makeRow(from expense: CursorExpense) -> CursorExpenseRowUIModel {
        let category = CursorExpenseCategory.spendCategories.first { $0.id == expense.categoryID }
            ?? CursorExpenseCategory.spendCategories.last!

        return CursorExpenseRowUIModel(
            id: expense.id,
            title: expense.title,
            amountText: formatAmount(expense.amount),
            categoryName: category.name,
            systemIconName: category.systemIconName,
            dateText: Self.dateFormatter.string(from: expense.createdAt)
        )
    }

    private func parseAmount(_ text: String) -> Decimal? {
        let normalized = text
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: ",", with: ".")
        return Decimal(string: normalized)
    }

    private func formatAmount(_ amount: Decimal) -> String {
        let number = NSDecimalNumber(decimal: amount)
        return Self.currencyFormatter.string(from: number) ?? "\(number) ₽"
    }

    private func expenseCountLabel(_ count: Int) -> String {
        let remainder10 = count % 10
        let remainder100 = count % 100

        if remainder100 >= 11, remainder100 <= 14 { return "расходов" }
        switch remainder10 {
        case 1: return "расход"
        case 2, 3, 4: return "расхода"
        default: return "расходов"
        }
    }

    private static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "RUB"
        formatter.maximumFractionDigits = 0
        return formatter
    }()

    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter
    }()
}
