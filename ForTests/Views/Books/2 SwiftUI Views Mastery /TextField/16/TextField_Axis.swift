//
//  TextField_Axis.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 TextField — настройка оси прокрутки (iOS 16+)

 • Свойство axis позволяет задать направление прокрутки текста внутри поля.
 • Полезно, если нужно позволить пользователю вводить длинные строки или многострочный текст.
 • Горизонтальный скролл сейчас работает не во всех стилях TextFieldStyle.
*/

import SwiftUI

struct TextField_Axis: View {
    // MARK: - Properties
    @State private var text = "This is some longer text that will cause the text fields to scroll text."

    // MARK: - Body
    var body: some View {
        VStack(spacing: 50) {
            // MARK: - Горизонтальная прокрутка
            Text("Scroll text horizontally")
                .font(.headline)
                .bold()

            TextField("Enter text", text: $text, axis: .horizontal)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            TextField("Enter text", text: $text, axis: .horizontal)
                .textFieldStyle(.plain)
                .padding(.horizontal)

            // MARK: - Вертикальная прокрутка
            Text("Scroll text vertically")
                .font(.headline)
                .bold()

            TextField("Enter text", text: $text, axis: .vertical)
                .lineLimit(2)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            TextField("Enter text", text: $text, axis: .vertical)
                .lineLimit(2)
                .textFieldStyle(.plain)
                .padding(.horizontal)
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    TextField_Axis()
}
