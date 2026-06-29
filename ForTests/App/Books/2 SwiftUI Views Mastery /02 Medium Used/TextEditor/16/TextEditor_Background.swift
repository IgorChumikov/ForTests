//
//  TextEditor_Background.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 TextEditor — изменение фона (iOS 16+)

 • Раньше фон TextEditor нельзя было изменить напрямую, так как он использует системный UIScrollView.
 • В iOS 16 появился модификатор .scrollContentBackground(_:) — он позволяет скрыть системный фон.
 • После этого можно добавить собственный цвет или градиент.
 • Работает с .background и .backgroundStyle.
*/

import SwiftUI

struct TextEditor_Background: View {
    // MARK: - Properties
    @State private var text =
    """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
    """

    // MARK: - Body
    var body: some View {
        VStack(spacing: 16) {
            // Вариант 1: фон через .background()
            TextEditor(text: $text)
                .scrollContentBackground(.hidden) // скрывает стандартный фон
                .padding()
                .background(.indigo.opacity(0.2), in: .rect(cornerRadius: 8)) // задаёт свой фон с закруглением

            // Вариант 2: фон через GroupBox и .backgroundStyle()
            GroupBox {
                TextEditor(text: $text)
                    .scrollContentBackground(.hidden)
            }
            .backgroundStyle(.teal.opacity(0.2))
        }
        .padding()
        .font(.title)
    }
}

#Preview {
    TextEditor_Background()
}
