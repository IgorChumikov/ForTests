//
//  TextEditor_LineSpacing.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

//
//  TextEditor_LineSpacing.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 TextEditor — межстрочный интервал (iOS 14+)

 • Модификатор .lineSpacing(_:) изменяет расстояние между строками текста.
 • Положительное значение увеличивает отступ между строками.
 • Отрицательное значение — уменьшает расстояние, сжимая строки.
 • Удобно для настройки читаемости длинного текста.
*/

import SwiftUI

struct TextEditor_LineSpacing: View {
    // MARK: - Properties
    @State private var text =
    """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
    """

    // MARK: - Body
    var body: some View {
        VStack(spacing: 40) {
            HeaderView3(
                title: "TextEditor",
                subtitle: "Line Spacing",
                desc: "Use the lineSpacing modifier to increase or decrease the amount of space between the lines of text.",
                back: .pink,
                textColor: .white
            )

            VStack {
                // Увеличенный интервал между строками
                Text("Line spacing: 20")
                TextEditor(text: $text)
                    .lineSpacing(20)
                    .font(.title2)
                    .frame(height: 200)
                    .padding(4)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondary, lineWidth: 1)
                    )

                // Уменьшенный интервал между строками
                Text("Line spacing: -8")
                TextEditor(text: $text)
                    .lineSpacing(-8)
                    .font(.title2)
                    .frame(height: 100)
                    .padding(4)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.secondary, lineWidth: 1)
                    )
            }
            .padding(.horizontal)

            Spacer()
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    TextEditor_LineSpacing()
}
