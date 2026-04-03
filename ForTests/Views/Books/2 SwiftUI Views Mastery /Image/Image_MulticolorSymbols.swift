//
//  Image_MulticolorSymbols.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Multicolor SF Symbols (iOS 14+)

 • Некоторые иконки имеют несколько цветов
 • Включаются через .renderingMode(.original)
 • В кнопках используем .tint()
 • Или можно использовать .foregroundStyle()
*/

import SwiftUI

struct Image_MulticolorSymbols: View {

    var body: some View {
        VStack(spacing: 40) {

            HeaderView3(
                title: "Image",
                subtitle: "Multicolor Symbols",
                desc: "Некоторые SF Symbols имеют несколько цветов — их можно включить через renderingMode.",
                back: .red,
                textColor: .primary
            )

            // MARK: - Объяснение
            Text("Некоторые системные иконки имеют несколько цветов. Включается через renderingMode(.original).")
                .padding()
                .background(Color.red)
                .foregroundStyle(.white)

            // MARK: - Multicolor включён
            Image(systemName: "note.text.badge.plus")
                .renderingMode(.original)
                .font(.largeTitle)

            // MARK: - Кнопка + tint
            Text("В кнопке цвет меняется через tint")
                .padding(.horizontal)

            Button(action: {}) {
                Image(systemName: "note.text.badge.plus")
                    .renderingMode(.original)
                    .tint(.red)
                    .font(.largeTitle)
            }

            // MARK: - foregroundStyle
            Text("Или можно использовать foregroundStyle")
            
            Image(systemName: "note.text.badge.plus")
                .renderingMode(.original)
                .foregroundStyle(.purple)
                .font(.largeTitle)

        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    Image_MulticolorSymbols()
}
