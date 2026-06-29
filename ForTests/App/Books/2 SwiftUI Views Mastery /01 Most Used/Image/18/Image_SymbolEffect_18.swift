//
//  Image_SymbolEffect_18.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Дополнительные symbolEffect (iOS 18+)

 • Добавлены новые анимации для SF Symbols
 • breathe — плавное "дыхание"
 • rotate — вращение
 • wiggle — покачивание
 • Работают так же, как и предыдущие эффекты
 */

import SwiftUI

struct Image_SymbolEffect_18: View {
    var body: some View {
        List {

            Label {
                Text("Breathe")
            } icon: {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
                    .symbolEffect(.breathe)
            }

            Label {
                Text("Rotate")
            } icon: {
                Image(systemName: "arrow.circlepath")
                    .foregroundStyle(.green)
                    .symbolEffect(.rotate)
            }

            Label {
                Text("Wiggle")
            } icon: {
                Image(systemName: "eraser.fill")
                    .foregroundStyle(.pink.opacity(0.5))
                    .symbolEffect(.wiggle)
            }
        }
        .listStyle(.plain)
        .listRowSpacing(60)
        .font(.title)
    }
}

#Preview {
    Image_SymbolEffect_18()
}
