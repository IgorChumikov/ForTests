//
//  TextEditor_KeyboardSafeArea.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 TextEditor — безопасная зона клавиатуры (iOS 14+)

 • При появлении клавиатуры SwiftUI автоматически сдвигает TextEditor вверх.
 • Safe area корректируется — клавиатура не перекрывает текстовое поле.
 • Пользователю не нужно вручную обрабатывать события клавиатуры.
 • Для закрытия клавиатуры можно использовать ранее добавленный метод hideKeyboard().
*/

import SwiftUI

struct TextEditor_KeyboardSafeArea: View {
    // MARK: - Properties
    @State private var text = ""

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            HeaderView3(
                title: "TextEditor",
                subtitle: "Keyboard Safe Area",
                desc: "TextEditors will automatically move into view when the keyboard appears. The keyboard adjusts the safe area so it will not cover views.",
                back: .pink,
                textColor: .white
            )

            Spacer()

            // Кнопка для скрытия клавиатуры
            Button {
                self.hideKeyboard()
            } label: {
                Image(systemName: "keyboard.chevron.compact.down")
            }

            // Поле ввода
            TextEditor(text: $text)
                .frame(height: 200)
                .padding(4)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.pink, lineWidth: 1)
                )
                .padding(.horizontal)

            Spacer()
        }
        .font(.title)
        .tint(.pink)
        .padding()
    }
}

#Preview {
    TextEditor_KeyboardSafeArea()
}
