//
//  TextEditor_CustomizingText.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 TextEditor — настройка внешнего вида текста (iOS 14+)

 • К TextEditor можно применять большинство модификаторов Text: шрифт, цвет текста, выравнивание и др.
 • .font(_:) задаёт стиль и размер шрифта.
 • .foregroundStyle(_:) изменяет цвет текста.
 • ⚠️ .background(_:) не работает напрямую — фон не изменяется, так как используется UIKit-компонент UITextView.
 • Чтобы задать фон, нужно обернуть TextEditor в контейнер с цветом.
*/

import SwiftUI

struct TextEditor_CustomizingText: View {
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
                subtitle: "Customize the Text",
                desc: "You can apply other modifiers that you usually use for the Text view to the TextEditor to customize the text.",
                back: .pink,
                textColor: .white
            )

            VStack {
                Text("Enter comments here")

                // Настроенный TextEditor
                TextEditor(text: $text)
                    .font(.system(size: 20, weight: .thin, design: .serif)) // шрифт с засечками
                    .foregroundStyle(.yellow) // цвет текста
                    .background(Color.red) // ⚠️ не работает напрямую
                    .border(Color.secondary.opacity(0.5), width: 1) // рамка вокруг
                    .frame(height: 150)
            }
            .padding(.horizontal)
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    TextEditor_CustomizingText()
}
