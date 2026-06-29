//
//  Text_Markdown.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 Text — поддержка Markdown (iOS 15+)

 • Markdown форматирование работает прямо внутри Text.
 • Поддерживаются курсив, жирный, ссылки и моноширинный текст.
*/

import SwiftUI

struct Text_Markdown: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView3(title: "Text",
            subtitle: "Markdown",
            desc: "You can include Markdown formatting inside of your Text views.",
            back: .green, textColor: .white)

            // Markdown-примеры
            VStack(alignment: .leading, spacing: 10) {
                Text("*Italic*")
                Text("_Italic_")
                Text("**Bold**")
                Text("__Bold__")
                Text("***Bold & Italic***")
                Text("___Bold & Italic___")
                Text("[URL](https://www.bigmountainstudio.com)")
                Text("`Code // Monospaced`")
            }
            .font(.title)
        }
    }
}

#Preview {
    Text_Markdown()
}
