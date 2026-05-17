import SwiftUI

// MARK: - CursorExpenseRowView

struct CursorExpenseRowView: View {

    // MARK: - Properties

    let model: CursorExpenseRowUIModel

    // MARK: - Body

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                Circle()
                    .fill(CursorExpensesTheme.pink.opacity(0.16))
                    .frame(width: 44, height: 44)

                Image(systemName: model.systemIconName)
                    .font(.body.weight(.semibold))
                    .foregroundStyle(CursorExpensesTheme.pink)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(model.title)
                    .font(.body.weight(.semibold))
                    .foregroundStyle(CursorExpensesTheme.pinkSoft)

                Text("\(model.categoryName) · \(model.dateText)")
                    .font(.caption)
                    .foregroundStyle(CursorExpensesTheme.pinkMuted)
            }

            Spacer(minLength: 8)

            Text(model.amountText)
                .font(.headline.weight(.bold))
                .foregroundStyle(CursorExpensesTheme.pink)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(CursorExpensesTheme.chipFill, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .strokeBorder(CursorExpensesTheme.cardStroke.opacity(0.7), lineWidth: 1)
        }
    }
}

// MARK: - Preview

#Preview {
    CursorExpenseRowView(
        model: CursorExpenseRowUIModel(
            id: UUID(),
            title: "Кофе",
            amountText: "320 ₽",
            categoryName: "Еда",
            systemIconName: "fork.knife",
            dateText: "18 мая 2026"
        )
    )
    .padding()
    .background(Color.black)
}
