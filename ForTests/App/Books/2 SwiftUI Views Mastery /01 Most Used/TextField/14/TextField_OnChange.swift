//
//  TextField_OnChange.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 TextField — отслеживание изменений (onChange) (iOS 14+)

 • Модификатор .onChange(of:) позволяет отслеживать изменения значения и реагировать на них.
 • Используется, например, для валидации ввода, ограничения длины текста или обновления данных в реальном времени.
 • Работает не только с TextField, но и с любым View (например, Toggle, Picker, Slider).
*/

import SwiftUI

struct TextField_OnChange: View {
    // MARK: - Properties
    @State private var text = ""

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            HeaderView3(
                title: "TextField",
                subtitle: "onChange",
                desc: "You can also use the onChange modifier to listen to changes and react to it. This is how you might use it to limit a user's text input.",
                back: .orange,
                textColor: .white
            )

            Text("Limit to 10 characters")

            // MARK: - Поле ввода с ограничением
            TextField("Enter up to 10 characters", text: $text)
                .onChange(of: text) { oldValue, newValue in
                    // Ограничиваем длину до 10 символов
                    text = String(newValue.prefix(10))
                }
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            // Показываем текущее значение
            Text("\"\(text)\"")
                .foregroundStyle(.gray)
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    TextField_OnChange()
}
