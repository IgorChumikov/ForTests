//
//  TextEditor_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 TextEditor — ввод многострочного текста (iOS 14+)

 • Используется для ввода длинного текста, например комментариев или описаний.
 • Поддерживает привязку к состоянию через @State.
 • Можно форматировать шрифт, цвет и рамку.
 • В отличие от TextField, поддерживает перенос строк.
*/

import SwiftUI

struct TextEditor_Intro: View {
    // MARK: - Properties
    @State private var text = "" // введённый пользователем текст

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            HeaderView3(
                title: "TextEditor",
                subtitle: "Introduction",
                desc: "Use the TextEditor to allow the user to enter a body of text that is more than a single line.",
                back: .pink,
                textColor: .white
            )

            VStack {
                Text("Enter comments here")

                // Основное поле ввода текста
                TextEditor(text: $text)
                    .font(.title2) // можно менять шрифт
                    .border(Color.secondary.opacity(0.5), width: 1) // рамка вокруг
                    .padding(.horizontal)
            }
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    TextEditor_Intro()
}
