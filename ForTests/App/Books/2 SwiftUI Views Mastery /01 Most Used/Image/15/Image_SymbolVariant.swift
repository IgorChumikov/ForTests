//
//  Image_SymbolVariant.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 symbolVariant (iOS 15+)

 • Позволяет менять вариант одной иконки
 • Например: fill / circle / square / slash
 • Работает поверх systemName
*/

import SwiftUI

struct Image_SymbolVariant: View {

    var body: some View {
        VStack(spacing: 20) {

            HeaderView3(
                title: "Image",
                subtitle: "Вариации иконок",
                desc: "Можно менять стиль одной и той же иконки через symbolVariant.",
                back: .red,
                textColor: .primary
            )

            // MARK: - Объяснение
            Text("Можно переключаться между разными вариантами одной иконки.")
                .padding()
                .background(Color.red)
                .foregroundStyle(.white)

            List {

                HStack {
                    Label("Обычная", systemImage: "lock")
                        .symbolVariant(.none)

                    Spacer()

                    Label("Fill", systemImage: "lock")
                        .symbolVariant(.fill)
                }

                HStack {
                    Label("Circle", systemImage: "lock")
                        .symbolVariant(.circle)

                    Spacer()

                    Label("Circle.fill", systemImage: "lock")
                        .symbolVariant(.circle.fill)
                }

                HStack {
                    Label("Rectangle", systemImage: "lock")
                        .symbolVariant(.rectangle)

                    Spacer()

                    Label("Rectangle.fill", systemImage: "lock")
                        .symbolVariant(.rectangle.fill)
                }

                HStack {
                    Label("Square", systemImage: "lock")
                        .symbolVariant(.square)

                    Spacer()

                    Label("Square.fill", systemImage: "lock")
                        .symbolVariant(.square.fill)
                }

                HStack {
                    Label("Slash", systemImage: "lock")
                        .symbolVariant(.slash)

                    Spacer()

                    Label("Slash.fill", systemImage: "lock")
                        .symbolVariant(.slash.fill)
                }
            }
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    Image_SymbolVariant()
}
