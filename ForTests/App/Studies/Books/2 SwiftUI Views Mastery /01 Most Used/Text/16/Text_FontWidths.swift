//
//  Text_FontWidths.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 Text — изменение ширины шрифта (iOS 16+)

 • .fontWidth(.compressed) — сжимает текст по горизонтали.
 • .fontWidth(.expanded) — растягивает текст.
 • Работает только с системным шрифтом.
*/

import SwiftUI

struct Text_FontWidths: View {
    var body: some View {
        VStack(spacing: 24) {
            // Суженные варианты
            Text("Hello, World!")
                .fontWidth(.compressed)

            Text("Hello, World!")
                .fontWidth(.condensed)

            // Стандартный
            Text("Hello, World!")
                .fontWidth(.standard)

            // Расширенный
            Text("Hello, World!")
                .fontWidth(.expanded)

            // Применение через font().width()
            Text("Hello, World!")
                .font(.largeTitle.weight(.heavy).width(.compressed))

            // Serif — без эффекта
            Text("Hello, World!")
                .fontDesign(.serif)
                .font(.largeTitle.weight(.heavy))

            // Serif с width() — эффект не применяется
            Text("Hello, World!")
                .fontDesign(.serif)
                .font(.largeTitle.weight(.heavy).width(.expanded))
        }
        .font(.largeTitle)
        .padding()
    }
}

#Preview {
    Text_FontWidths()
}
