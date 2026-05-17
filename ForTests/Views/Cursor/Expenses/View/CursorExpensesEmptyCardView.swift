import SwiftUI

// MARK: - CursorExpensesEmptyCardView

struct CursorExpensesEmptyCardView: View {

    // MARK: - Body

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "tray")
                .font(.largeTitle)
                .foregroundStyle(CursorExpensesTheme.pink)

            Text("Пока нет расходов в этой категории")
                .font(.callout)
                .multilineTextAlignment(.center)
                .foregroundStyle(CursorExpensesTheme.pinkSoft)
        }
        .padding(24)
        .frame(maxWidth: .infinity)
        .background(CursorExpensesTheme.cardFill, in: RoundedRectangle(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(CursorExpensesTheme.cardStroke, lineWidth: 1)
        }
    }
}

// MARK: - Preview

#Preview {
    CursorExpensesEmptyCardView()
        .padding()
        .background(Color.black)
}
