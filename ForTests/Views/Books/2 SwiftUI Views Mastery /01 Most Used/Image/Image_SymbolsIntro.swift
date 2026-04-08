//
//  Image_SymbolsIntro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Image(systemName:) — работа с SF Symbols (iOS 14+)

 • Это встроенные иконки от Apple (SF Symbols)
 • Не нужно добавлять изображения в Assets
 • Названия иконок берутся из приложения SF Symbols
 • Цвет задаётся через .foregroundStyle()
*/

import SwiftUI

struct Image_SymbolsIntro: View {

    // MARK: - Body
    var body: some View {
        VStack(spacing: 40) {

            HeaderView3(
                title: "Image",
                subtitle: "Из системных иконок",
                desc: "Используй системные иконки через параметр systemName.",
                back: .red,
                textColor: .primary
            )

            // MARK: - Объяснение (красный блок)
            Text("Можно использовать Image для загрузки системных иконок (symbols) через параметр systemName.")
                .padding()
                .background(Color.red)
                .foregroundStyle(.white)

            // MARK: - Пример иконок
            Text("Примеры системных иконок:")

            HStack(spacing: 40) {
                Image(systemName: "cloud.sun.fill")
                Image(systemName: "cloud.sun.rain.fill")
                Image(systemName: "cloud.sun.bolt.fill")
            }

            // MARK: - Подсказка
            Text("Совет: используй приложение SF Symbols, чтобы посмотреть более 1500 иконок.")

            DescView(desc: "Цвет задаётся через модификатор foregroundStyle")

            // MARK: - Цветные иконки
            HStack(spacing: 40) {
                Image(systemName: "cloud.sun.fill")
                    .foregroundStyle(.red)

                Image(systemName: "cloud.sun.rain.fill")
                    .foregroundStyle(.orange)

                Image(systemName: "cloud.sun.bolt.fill")
                    .foregroundStyle(.yellow)
            }

        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    Image_SymbolsIntro()
}
