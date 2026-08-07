import SwiftUI

// MARK: - CursorExpensesSummaryCardView

struct CursorExpensesSummaryCardView: View {

    // MARK: - Properties

    let model: CursorExpensesSummaryUIModel

    // MARK: - Body

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: model.systemIconName)
                .font(.system(size: 56))
                .symbolRenderingMode(.palette)
                .foregroundStyle(CursorExpensesTheme.pink, CursorExpensesTheme.pinkSoft)
                .symbolEffect(.bounce, value: model.filterTitle)

            Text(model.totalText)
                .font(.system(size: 64, weight: .thin, design: .rounded))
                .foregroundStyle(CursorExpensesTheme.pink)

            Text(model.filterTitle)
                .font(.title3.weight(.medium))
                .foregroundStyle(CursorExpensesTheme.pinkSoft)

            Text(model.expenseCountText)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(CursorExpensesTheme.pinkMuted)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 32)
        .padding(.horizontal, 24)
        .background(CursorExpensesTheme.cardFill, in: RoundedRectangle(cornerRadius: 28, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .strokeBorder(CursorExpensesTheme.cardStroke, lineWidth: 1)
        }
    }
}

// MARK: - Preview

#Preview {
    CursorExpensesSummaryCardView(
        model: CursorExpensesSummaryUIModel(
            filterTitle: "Еда",
            systemIconName: "fork.knife",
            totalText: "2 340 ₽",
            expenseCountText: "3 расхода",
            rows: []
        )
    )
    .padding()
    .background(Color.black)
}
