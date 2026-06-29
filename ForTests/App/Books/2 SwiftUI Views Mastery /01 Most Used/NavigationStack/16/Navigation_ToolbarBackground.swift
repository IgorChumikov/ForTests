//
//  Navigation_ToolbarBackground.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 Настройка фона NavigationBar через .toolbarBackground (iOS 16+)

 • Начиная с iOS 16 в NavigationStack появилась нативная возможность
   управлять фоном навигационной панели без использования
   UINavigationBarAppearance.

 • Основные варианты:
      .toolbarBackground(.visible, for: .navigationBar)
          – делает фон панели явно видимым.

      .toolbarBackground(Color.blue, for: .navigationBar)
          – задаёт конкретный цвет.

      .toolbarBackground(.thinMaterial, for: .navigationBar)
          – применяет системный матовый материал.

 • По умолчанию фон навбара может быть прозрачным,
   поэтому если хотите увидеть цвет → обязательно указывайте
   как минимум .toolbarBackground(.visible, for: .navigationBar).

 • Важно:
      – .ignoresSafeArea() относится к контенту экрана,
        но не влияет на сам NavigationBar.
      – .toolbarBackground работает только внутри NavigationStack.
      – Для контроля цвета текста/кнопок используется .toolbarColorScheme().
 */


import SwiftUI

struct Navigation_ToolbarBackground: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.green.opacity(0.25)
                    .ignoresSafeArea()
            }
            .navigationTitle("Toolbar Background")
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    Navigation_ToolbarBackground()
}
