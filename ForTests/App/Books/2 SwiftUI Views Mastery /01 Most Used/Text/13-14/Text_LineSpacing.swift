//
//  Text_LineSpacing.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 Text — межстрочный интервал (iOS 13+)

 • .lineSpacing(_:) — задаёт отступ между строками.
 • Используется для улучшения читаемости текста.
*/

import SwiftUI

struct Text_LineSpacing: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Text")
                .font(.largeTitle)
            Text("Line Spacing")
                .font(.title)
                .foregroundStyle(.gray)
            Image(systemName: "text.alignleft")

            // Без lineSpacing
            Text("""
            You can use line spacing to add more space between lines of text. This text has no line spacing applied.
            SwiftUI offers a Line Spacing modifier for situations where you want to increase the space between the lines of text on the screen.
            """)
            .font(.title3)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.green)
            .foregroundStyle(.white)

            // С lineSpacing(16)
            Text("With Line Spacing of 16:")
                .font(.title2)

            Text("""
            SwiftUI offers a Line Spacing modifier for situations where you want to increase the space between the lines of text on the screen.
            """)
            .font(.title3)
            .lineSpacing(16) // добавляем отступ между строками
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.green)
            .foregroundStyle(.white)
        }
        .padding()
    }
}

#Preview {
    Text_LineSpacing()
}
