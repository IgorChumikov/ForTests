//
//  TextField_Customizing.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 TextField — настройка цвета и стиля (iOS 14+)

 • Можно кастомизировать внешний вид TextField, добавив фон или рамку вручную.
 • Используйте .background() с RoundedRectangle для окрашенного фона.
 • Используйте .overlay() с RoundedRectangle для обводки.
 • Цвет текста задаётся через .foregroundStyle(_:) или .foregroundColor(_:) .
 • Это удобно, если не используется стандартный стиль .textFieldStyle().
*/

import SwiftUI

struct TextField_Customizing: View {
    // MARK: - Properties
    @State private var textFieldWithText = "With Text"
    @State private var textFieldNoText = ""
    @State private var withOutline = "With Outline"

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            Text("TextField")
                .font(.largeTitle)

            Text("Customizing")
                .foregroundStyle(.gray)

            Text("One way to customize TextFields is to add a shape behind one that has no TextFieldStyle set.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)

            // MARK: - Пример 1: с цветным фоном
            TextField("Placeholder Text", text: $textFieldNoText)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(hue: 0.126, saturation: 0.47, brightness: 0.993))
                )
                .foregroundStyle(.gray)
                .padding()

            // MARK: - Пример 2: с обводкой
            TextField("Placeholder Text", text: $withOutline)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.orange, lineWidth: 2)
                )
                .padding()

            // MARK: - Пример 3: изменение цвета текста
            Text("Change text color using the foregroundStyle property.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)

            TextField("first name", text: $textFieldWithText)
                .textFieldStyle(.roundedBorder)
                .foregroundStyle(.orange)
                .padding(.horizontal)
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    TextField_Customizing()
}
