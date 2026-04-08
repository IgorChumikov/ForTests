//
//  List_Badge.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 badge / badgeProminence — индикаторы внимания для строк списка (iOS 15+ / iOS 17+)

 • .badge() добавляет маленький индикатор справа от строки — число или текст.
   Используется для уведомлений, счётчиков, статусов и количества элементов.

 • Поддерживает как числа (Int), так и произвольные View:
      – .badge(3)
      – .badge(Text("New").font(.headline))

 • .badgeProminence (iOS 17+) регулирует заметность бейджа:
      – .decreased — менее яркий, спокойный;
      – .standard — стандартный вариант;
      – .increased — акцентный, броский, подходит для важных уведомлений.

 • Работает в List, TabView, меню и любом месте, где SwiftUI поддерживает бейджи.
 */


import SwiftUI

struct List_Badge: View {
    var body: some View {
        VStack(spacing: 20.0) {
            List {
                Text("Row 0")
                    .badge(0)
                
                Text("Row 0")
                    .badge(Text("0"))
                
                Text("Row 1")
                    .badge(1)
                    .foregroundStyle(.red)
                
                Text("Row 2")
                    .badge(2)
                    .font(.title3.weight(.bold))
                
                Text("Row 2")
                    .badge(Text("2").font(.title3.weight(.bold)))
                    .font(.title3.weight(.bold))
                
                Text("Row 3")
                    .badge(3)
                    .badgeProminence(.decreased)
                
                Text("Row 4")
                    .badge(4)
                    .badgeProminence(.standard)
                
                Text("Row 5")
                    .badge(5)
                    .badgeProminence(.increased)
            }
        }
        .font(.title)
    }
}

#Preview {
    List_Badge()
}
