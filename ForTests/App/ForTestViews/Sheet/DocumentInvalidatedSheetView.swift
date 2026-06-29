//
//  DocumentInvalidatedSheetView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 23.05.2025.
//

import SwiftUI

struct DocumentInvalidatedSheetView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 16) {
            // Заголовок
            Text("Событие с документом на контроле")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.top, 20)

            // Красная плашка
            HStack(alignment: .top, spacing: 8) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.red)
                    .padding(.top, 2)

                Text("Документ утратил силу или отменен")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
            }
            .padding()
            .background(Color.red.opacity(0.1))
            .cornerRadius(12)
            .padding(.horizontal)

            // Ссылка на примечание
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

#Preview {
    DocumentInvalidatedSheetView()
}
