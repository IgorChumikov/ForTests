//
//  List_Badge.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 .badge() — модификатор, добавляющий маленький индикатор (цифру или текст) справа от строки списка, вкладки или меню.
 Доступен начиная с iOS 15.
 
 .badgeProminence() (с iOS 17) — задаёт заметность бейджа:
 .decreased — менее заметный;
 .standard — обычный;
 .increased — более заметный (например, ярко-красный фон).
 
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
