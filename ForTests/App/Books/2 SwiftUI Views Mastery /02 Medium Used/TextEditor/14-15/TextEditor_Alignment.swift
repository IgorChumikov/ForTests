//
//  TextEditor_Alignment.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 TextEditor — выравнивание текста (iOS 14+)

 • По умолчанию текст в TextEditor выравнивается по leading (левому краю).
 • С помощью .multilineTextAlignment(_:) можно задать центр или правый край.
 • Работает аналогично модификатору для Text.
 • Полезно при оформлении заметок, цитат или ввода с выравниванием.
*/

import SwiftUI

struct TextEditor_Alignment: View {
    // MARK: - Properties
    @State private var text =
    """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
    """

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            HeaderView3(
                title: "TextEditor",
                subtitle: "Alignment",
                desc: "By default the alignment is leading. You can change this just as you can change it for the Text view.",
                back: .pink,
                textColor: .white
            )

            VStack(spacing: 16) {
                // Текст по левому краю
                TextEditor(text: $text)
                    .multilineTextAlignment(.leading)
                    .font(.title2)
                    .frame(height: 130)
                    .border(Color.secondary.opacity(0.5), width: 1)

                // Текст по центру
                TextEditor(text: $text)
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .frame(height: 130)
                    .border(Color.secondary.opacity(0.5), width: 1)

                // Текст по правому краю
                TextEditor(text: $text)
                    .multilineTextAlignment(.trailing)
                    .font(.title2)
                    .frame(height: 130)
                    .border(Color.secondary.opacity(0.5), width: 1)
            }
            .padding(.horizontal)
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    TextEditor_Alignment()
}
