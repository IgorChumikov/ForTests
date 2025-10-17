//
//  Navigation_NavBarItems.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 NavigationStack (iOS 16+) позволяет добавлять кнопки в навигационную панель
с помощью модификатора `.toolbar { ... }`.
 
 • `.topBarLeading` — размещает элемент слева (leading).
 • `.topBarTrailing` — размещает элемент справа (trailing).
 • `.tint(_:)` — изменяет цвет иконок и текста кнопок.
 
 Для более продвинутых примеров см. раздел:
 Controls Modifiers → Toolbar.
 
 */

import SwiftUI

struct Navigation_NavBarItems: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("You can add navigation bar buttons to the leading or trailing (or both) sides of a navigation bar.")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Navigation Bar Buttons")
            .toolbar {
                // Левая кнопка (leading)
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {}) {
                        Image(systemName: "bell.fill")
                            .padding(.horizontal)
                    }
                }
                
                // Правая кнопка (trailing)
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Actions", action: { })
                }
            }
            .tint(.pink) // Цвет иконок и кнопок
        }
    }
}

#Preview {
    Navigation_NavBarItems()
}
