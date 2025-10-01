//
//  DocumentEventSheetView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 23.05.2025.
//

import SwiftUI

struct DocumentControlSheetView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 16) {
            // Заголовок
            Text("Событие с документом на контроле")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.top, 20)

            // Желтая плашка
            HStack(alignment: .top, spacing: 8) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(Color.yellow.darken())
                    .padding(.top, 2)

                Text("Вступили в силу изменения, внесенные в документ")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
            }
            .padding()
            .background(Color.yellow.opacity(0.2))
            .cornerRadius(12)
            .padding(.horizontal)

            // Кнопка "Перейти к обзору изменений"
            SheetActionRow(
                text: "Перейти к обзору изменений",
                icon: "square.and.pencil",
                iconColor: Color.purple
            )

            Divider().padding(.leading)

            // Кнопка "Перейти к примечанию в Справке"
            SheetActionRow(
                text: "Перейти к примечанию в Справке",
                icon: "arrow.turn.down.right",
                iconColor: Color.purple
            )

            // Кнопка закрытия
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: 26, weight: .semibold))
                    .foregroundColor(.orange)
                    .padding(.top, 20)
            }

            Spacer(minLength: 8)
        }
        .padding(.bottom, 24)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(UIColor.systemBackground))
        )
    }
}

// MARK: - Row Component

struct SheetActionRow: View {
    let text: String
    let icon: String
    let iconColor: Color

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(iconColor)
            Text(text)
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .font(.system(size: 15))
        .padding(.horizontal)
        .padding(.vertical, 12)
    }
}

// MARK: - Цвет потемнее для желтого значка
extension Color {
    func darken(amount: Double = 0.3) -> Color {
        return self.opacity(1.0 - amount)
    }
}


#Preview {
    DocumentControlSheetView()
}



//DocumentEventSheetView
