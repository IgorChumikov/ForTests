//
//  Text_TextSelection.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 Text — выбор и копирование текста (iOS 15+)

 • Позволяет пользователю выделять и копировать текст по долгому тапу.
 • Работает как в Text, так и во вложенных контейнерах (VStack, ScrollView).
*/

import SwiftUI

struct Text_TextSelection: View {
    var body: some View {
        VStack(spacing: 60) {
            // Заголовок
            HeaderView3(
                title: "Text",
                subtitle: "TextSelection",
                desc: "Add the textSelection modifier to allow users to long-press and copy text.",
                back: .green,
                textColor: .white
            )

            // Без возможности выделения
            Text("No Text Selection")

            // С возможностью выделения и копирования
            Text("Text Selection Enabled")
                .textSelection(.enabled)
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Text_TextSelection()
}
