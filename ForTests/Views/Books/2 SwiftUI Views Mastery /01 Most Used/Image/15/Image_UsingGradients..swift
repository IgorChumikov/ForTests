//
//  Image_UsingGradients.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 foregroundStyle с градиентами (iOS 15+)

 • foregroundStyle поддерживает не только цвета, но и градиенты
 • Можно применять LinearGradient и RadialGradient к иконкам
 • Можно комбинировать несколько градиентов
 • Работает через режим .palette
 */

import SwiftUI

struct Image_UsingGradients: View {
    var body: some View {
        VStack(spacing: 20.0) {

            HeaderView3(
                title: "Image - Symbols",
                subtitle: "Using Gradients",
                desc: "foregroundStyle поддерживает не только цвета. Можно применять градиенты к иконкам.",
                back: .red,
                textColor: .primary
            )

            Image(systemName: "bookmark.circle.fill")
                .font(.system(size: 100))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .green],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

            Image(systemName: "bookmark.circle.fill")
                .font(.system(size: 100))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .green],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    RadialGradient(
                        colors: [.yellow.opacity(0.75), .white],
                        center: .bottomTrailing,
                        startRadius: 40,
                        endRadius: 120
                    )
                )
        }
        .font(.title)
    }
}

#Preview {
    Image_UsingGradients()
}
