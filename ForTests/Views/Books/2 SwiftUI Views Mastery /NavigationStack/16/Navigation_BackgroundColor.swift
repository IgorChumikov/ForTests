//
//  Navigation_BackgroundColor.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 Изменение фона экрана в NavigationStack (iOS 16+)

 • NavigationStack поддерживает полноэкранный фон,
   но чтобы цвет уходил под NavigationBar, нужен .ignoresSafeArea().

 • ZStack используется для наложения сразу нескольких слоёв:
      – нижний слой: основной фон (Color.green.opacity)
      – верхний слой: полупрозрачный оверлей (Color.gray.opacity)

 • Важно: .ignoresSafeArea() ставится на цвет,
   который должен покрыть область под навигационной панелью.

 • navigationTitle не влияет на отрисовку фона —
   NavigationStack оставляет фон прозрачным, если вы не используете
   UINavigationBarAppearance.
 */


import SwiftUI

struct Navigation_BackgroundColor: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.green.opacity(0.25)
                    .ignoresSafeArea() // фон под навигационной панелью
                
                Color.gray.opacity(0.25)
            }
            .navigationTitle("Background Color")
        }
    }
}

#Preview {
    Navigation_BackgroundColor()
}
