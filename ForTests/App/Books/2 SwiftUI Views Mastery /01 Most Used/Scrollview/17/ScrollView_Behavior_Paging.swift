//
//  ScrollView_Behavior_Paging.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 ScrollView — постраничная прокрутка (Paging) (iOS 17+)
 
 • Модификатор `.scrollTargetBehavior(.paging)` включает **постраничную прокрутку** внутри ScrollView.
 • Чтобы она работала, нужно:
    1️⃣  Добавить `.scrollTargetLayout()` на контейнер с элементами (например, HStack).
    2️⃣  Задать размер каждой страницы через `.containerRelativeFrame(.horizontal)`.
 • Используется чаще всего для каруселей, onboarding-экранов и страниц контента.
 
 */

import SwiftUI

struct ScrollView_Behavior_Paging: View {
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
                        // 1️⃣ Устанавливаем ширину страницы
                        .containerRelativeFrame(.horizontal)
                }
            }
            // 2️⃣ Активируем постраничное выравнивание элементов
            .scrollTargetLayout()
        }
        // 3️⃣ Включаем режим «paging»
        .scrollTargetBehavior(.paging)
        .font(.title)
    }
}

#Preview {
    ScrollView_Behavior_Paging()
}
