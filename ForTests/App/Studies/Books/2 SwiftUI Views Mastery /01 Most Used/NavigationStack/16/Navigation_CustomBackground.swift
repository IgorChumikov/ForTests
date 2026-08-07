//
//  Navigation_CustomBackground.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 Кастомный фон под NavigationBar с помощью .background(_:ignoresSafeAreaEdges:) (iOS 16+)

 Начиная с iOS 16 в SwiftUI появилась возможность добавлять фон,
который игнорирует safe area только по выбранным краям.
Это позволяет «растянуть» цвет, градиент или любой кастомный фон
под навигационную панель без использования UIKit-костылей.

 Ключевые особенности:
 • .background(_:ignoresSafeAreaEdges:) работает поверх layout-системы,
   поэтому фон визуально уходит под NavigationBar.
 • Можно точно выбрать края, которые игнорируются:
       .top — фон зайдёт под навигационную панель
       .bottom — фон зайдёт под Home Indicator
       [.top, .bottom] — полный охват
 • В отличие от .ignoresSafeArea(), это поведение управляется локально
   и применяется только к конкретной вью, а не ко всему экрану.

 Когда это нужно:
 • создать градиент под NavigationBar;
 • сделать декоративную полосу или кастомную тень под панелью;
 • повторить визуальный стиль из дизайна, где фон начинается «выше» контента.

 Примечание:
 • При использовании NavigationStack фон накладывается корректно.
 • Для изменения цвета самой панели по-прежнему используется .toolbarBackground().
 */


import SwiftUI

struct Navigation_CustomBackground: View {
    var body: some View {
        NavigationStack {
            VStack {
                Divider()
                    .background(
                        LinearGradient(
                            colors: [.green, .blue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .opacity(0.5)
                        .shadow(.drop(radius: 2, y: 2)),
                        ignoresSafeAreaEdges: .top
                    )
                
                Spacer()
            }
            .navigationTitle("Custom Background")
        }
    }
}

#Preview {
    Navigation_CustomBackground()
}
