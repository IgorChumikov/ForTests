//
//  Path_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.04.2026.
//

/*
 Path — базовое использование (iOS 14+)

 • Path позволяет рисовать линии и фигуры вручную
 • Сам по себе Path не отображается
 • Нужно использовать .stroke() или .fill()
 • move(to:) — начальная точка
 • addLine(to:) — рисует линию
*/

import SwiftUI

struct Path_Intro: View {

    // MARK: - Body
    var body: some View {
        VStack(spacing: 30) {

            HeaderView3(
                title: "Path",
                subtitle: "Introduction",
                desc: "Draw custom lines using Path",
                back: .purple,
                textColor: .white
            )

            // MARK: - Path без модификатора (не видно)
            Text("Ты не увидишь Path без modifier:")

            Path { path in
                path.move(to: CGPoint(x: 10, y: 10))   // 👉 стартовая точка
                path.addLine(to: CGPoint(x: 200, y: 10)) // 👉 линия вправо
            }
            // ❗️ НЕТ .stroke → ничего не видно

            // MARK: - Path с линией (как красная линия на скрине)
            Text("Рисуем линию:")

            Path { path in
                path.move(to: CGPoint(x: 10, y: 10))     // 👉 начало
                path.addLine(to: CGPoint(x: 200, y: 10)) // 👉 линия
            }
            .stroke(.red, lineWidth: 5) // 🔥 теперь видно (красная линия)

            // MARK: - Кастомный divider (как фиолетовый)
            Text("Кастомный divider:")

            MyDivider(lineWidth: 5, color: .purple)

        }
        .padding()
    }
}

#Preview {
    Path_Intro()
}

struct MyDivider: View {

    var lineWidth: CGFloat = 1
    var color: Color = .secondary

    var body: some View {
        GeometryReader { geometry in

            Path { path in
                path.move(to: CGPoint(x: 10, y: 10)) // 👉 старт
                path.addLine(
                    to: CGPoint(
                        x: geometry.size.width - 10, // 👉 на всю ширину
                        y: 10
                    )
                )
            }
            .stroke(
                color,
                style: StrokeStyle(
                    lineWidth: lineWidth,
                    lineCap: .round // 👉 скругленные края
                )
            )
        }
        .frame(height: 20)
    }
}
