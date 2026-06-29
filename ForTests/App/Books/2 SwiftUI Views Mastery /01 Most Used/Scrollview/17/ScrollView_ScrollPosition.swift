//
//  ScrollView_ScrollPosition.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 ScrollView — отслеживание и установка позиции прокрутки (iOS 17+)
 
 • Позволяет отслеживать, какой элемент сейчас виден пользователю с помощью `.scrollPosition(id:)`.
 • Также можно программно переходить к нужному элементу, просто изменяя связанное значение `@State`.
 
 ⚙️ Как это работает:
 1️⃣ Создаём свойство, которое хранит текущий элемент (например, `@State private var currentColor`).
 2️⃣ Привязываем его к `.scrollPosition(id:)`, чтобы система автоматически обновляла значение при прокрутке.
 3️⃣ Можно менять значение вручную с анимацией — ScrollView плавно перейдёт к нужному элементу.
 
 */

import SwiftUI

struct ScrollView_ScrollPosition: View {
    var items = [Color.green, .blue, .purple, .pink, .yellow, .orange]
    
    // 1️⃣ Текущее положение (связанное с элементом)
    @State private var currentColor: Color? = .green
    
    var body: some View {
        VStack(spacing: 24) {
            
            // MARK: - Прокручиваемая область
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(items, id: \.self) { color in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(color)
                            .padding()
                            // Каждая страница занимает всю ширину контейнера
                            .containerRelativeFrame(.horizontal)
                    }
                }
                .scrollTargetLayout()
            }
            // MARK: - Paging и отслеживание позиции
            .scrollTargetBehavior(.paging)
            .scrollPosition(id: $currentColor)
            
            // MARK: - Текущее значение
            Text("Current color: \(currentColor?.description.capitalized ?? "None")")
                .font(.headline)
            
            // MARK: - Кнопка для программной прокрутки
            Button("Go to Orange") {
                withAnimation {
                    currentColor = .orange
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    ScrollView_ScrollPosition()
}
