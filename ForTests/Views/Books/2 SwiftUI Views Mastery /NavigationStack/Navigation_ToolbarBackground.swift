//
//  Navigation_ToolbarBackground.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 Начиная с iOS 16, в NavigationStack можно изменять фон навигационной панели
через модификатор `.toolbarBackground(_:for:)`.
 
 • `.toolbarBackground(.visible, for: .navigationBar)` — делает фон навбара видимым.
 • Можно также указать конкретный цвет или материал (например, `.thinMaterial`).
 
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
