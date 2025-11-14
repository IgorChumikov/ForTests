//
//  ScrollView_Behavior_ViewAligned.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 ScrollView — выравнивание видимых элементов (View-Aligned) (iOS 17+)
 
 • `.scrollTargetBehavior(.viewAligned)` выравнивает элементы внутри видимой области,
   «прищёлкивая» (snap) ближайший элемент к краю.
 • Удобно для случаев, когда нужно, чтобы карточки, плитки или изображения
   останавливались чётко на экране, а не на середине.
 • Совместно используется с `.scrollTargetLayout()` и `.containerRelativeFrame()`.
 
 */

import SwiftUI

struct ScrollView_Behavior_ViewAligned: View {
    var items = [
        Color.green, .blue, .purple, .pink, .yellow, .orange
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 0) {
                ForEach(items, id: \.self) { color in
                    RoundedRectangle(cornerRadius: 15)
                        .fill(color)
                        .padding()
                        // MARK: - Настройка области отображения
                        .containerRelativeFrame(
                            .horizontal,
                            count: 5,
                            span: 4,
                            spacing: 20,
                            alignment: .leading
                        )
                }
            }
            // Определяем область выравнивания для элементов
            .scrollTargetLayout()
        }
        // Активируем поведение выравнивания по видимой области
        .scrollTargetBehavior(.viewAligned)
        .font(.title)
    }
}

#Preview {
    ScrollView_Behavior_ViewAligned()
}
