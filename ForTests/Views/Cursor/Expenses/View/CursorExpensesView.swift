import SwiftUI

// MARK: - CursorExpensesView

struct CursorExpensesView: View {

    // MARK: - Properties

    @StateObject private var viewModel = CursorExpensesViewModel()

    // MARK: - Body

    var body: some View {
        ZStack {
            background

            VStack(spacing: 20) {
                titleSection
                categoryPicker
                mainContent
                addExpenseSection
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 32)
        }
        .preferredColorScheme(.dark)
        .task {
            viewModel.loadExpenses()
        }
        .animation(.easeInOut(duration: 0.35), value: viewModel.state)
        .animation(.easeInOut(duration: 0.25), value: viewModel.selectedCategory.id)
    }
}

// MARK: - Background

private extension CursorExpensesView {
    var background: some View {
        LinearGradient(
            colors: [CursorExpensesTheme.backgroundTop, CursorExpensesTheme.backgroundBottom],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}

// MARK: - Header

private extension CursorExpensesView {
    var titleSection: some View {
        VStack(spacing: 6) {
            Label("Расходы", systemImage: "rublesign.circle.fill")
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(CursorExpensesTheme.pinkSoft)

            Text(viewModel.selectedCategory.name)
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundStyle(CursorExpensesTheme.pink)
        }
    }
}

// MARK: - Category Picker

private extension CursorExpensesView {
    var categoryPicker: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(CursorExpenseCategory.presets) { category in
                    categoryChip(category)
                }
            }
            .padding(.horizontal, 2)
        }
    }

    func categoryChip(_ category: CursorExpenseCategory) -> some View {
        let isSelected = viewModel.selectedCategory == category

        return Button {
            viewModel.selectCategory(category)
        } label: {
            Label(category.name, systemImage: category.systemIconName)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(isSelected ? Color.black : CursorExpensesTheme.pinkSoft)
                .padding(.horizontal, 14)
                .padding(.vertical, 10)
                .background(
                    isSelected ? CursorExpensesTheme.pink : CursorExpensesTheme.chipFill,
                    in: Capsule()
                )
                .overlay {
                    if !isSelected {
                        Capsule()
                            .strokeBorder(CursorExpensesTheme.cardStroke, lineWidth: 1)
                    }
                }
        }
        .buttonStyle(.plain)
        .disabled(isCategoryPickerDisabled)
    }

    var isCategoryPickerDisabled: Bool {
        if case .loading = viewModel.state { return true }
        return false
    }
}

// MARK: - Main Content

private extension CursorExpensesView {
    @ViewBuilder
    var mainContent: some View {
        switch viewModel.state {
        case .loading:
            ProgressView("Загрузка…")
                .tint(CursorExpensesTheme.pink)
                .foregroundStyle(CursorExpensesTheme.pinkSoft)
                .scaleEffect(1.2)
                .frame(maxHeight: .infinity)

        case .success(let model):
            ScrollView {
                VStack(spacing: 16) {
                    CursorExpensesSummaryCardView(model: model)

                    if model.rows.isEmpty {
                        CursorExpensesEmptyCardView()
                    } else {
                        ForEach(model.rows) { row in
                            CursorExpenseRowView(model: row)
                                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                    Button(role: .destructive) {
                                        viewModel.deleteExpense(id: row.id)
                                    } label: {
                                        Label("Удалить", systemImage: "trash")
                                    }
                                }
                        }
                    }
                }
            }
            .transition(.opacity.combined(with: .move(edge: .bottom)))

        case .error(let message):
            VStack(spacing: 12) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.largeTitle)
                    .foregroundStyle(CursorExpensesTheme.pink)

                Text(message)
                    .font(.callout)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(CursorExpensesTheme.pinkSoft)
            }
            .padding(24)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(CursorExpensesTheme.cardFill, in: RoundedRectangle(cornerRadius: 20))
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(CursorExpensesTheme.cardStroke, lineWidth: 1)
            }
            .transition(.opacity)
        }
    }
}

// MARK: - Add Expense

private extension CursorExpensesView {
    var addExpenseSection: some View {
        VStack(spacing: 12) {
            HStack(spacing: 10) {
                TextField("Название", text: $viewModel.draftTitle)
                    .textInputAutocapitalization(.sentences)

                TextField("Сумма", text: $viewModel.draftAmount)
                    .keyboardType(.decimalPad)
                    .frame(width: 100)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(CursorExpensesTheme.chipFill, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
            .foregroundStyle(CursorExpensesTheme.pinkSoft)

            Picker("Категория", selection: $viewModel.selectedSpendCategory) {
                ForEach(CursorExpenseCategory.spendCategories) { category in
                    Text(category.name).tag(category)
                }
            }
            .pickerStyle(.segmented)

            Button {
                viewModel.addExpense()
            } label: {
                Label("Добавить расход", systemImage: "plus.circle.fill")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(CursorExpensesTheme.chipFill, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .foregroundStyle(CursorExpensesTheme.pink)
                    .overlay {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .strokeBorder(CursorExpensesTheme.pink.opacity(0.5), lineWidth: 1)
                    }
            }
            .disabled(isAddButtonDisabled)
        }
    }

    var isAddButtonDisabled: Bool {
        if case .loading = viewModel.state { return true }
        return false
    }
}

// MARK: - Preview

#Preview {
    CursorExpensesView()
}
