//
//  TextEditor_LineLimit.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 TextEditor — ограничение количества строк (iOS 14+)

 • Модификатор .lineLimit(_:) предназначен для ограничения количества строк ввода.
 • Однако в текущих версиях SwiftUI (до iOS 17 включительно) этот модификатор не работает с TextEditor.
 • Apple упоминает lineLimit в документации, поэтому, возможно, поддержка появится в будущем.
 • В качестве обходного пути можно задать фиксированную высоту через .frame(height:) или контролировать текст вручную.
*/

import SwiftUI

struct TextEditor_LineLimit: View {
    // MARK: - Properties
    @State private var text = ""

    // MARK: - Body
    var body: some View {
        VStack(spacing: 40) {
            HeaderView3(
                title: "TextEditor",
                subtitle: "Line Limit",
                desc: "Use the lineLimit modifier to restrict how much text to allow the user to enter.",
                back: .pink,
                textColor: .white
            )

            VStack {
                Text("Enter 2 lines of comments here")

                // Поле ввода текста с нерабочим .lineLimit()
                TextEditor(text: $text)
                    .lineLimit(2) // ❌ пока не работает для TextEditor
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
    TextEditor_LineLimit()
}
