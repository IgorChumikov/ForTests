//
//  TabView_ToolbarBackgroundVisibility.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 TabView — видимость и цвет панели вкладок (iOS 18+)

 • .toolbarBackgroundVisibility(.visible, for: .tabBar) делает фон панели всегда видимым.
 • .toolbarBackground(Color.teal.opacity(0.25), for: .tabBar) задаёт цвет фона.
 • Вместе они обеспечивают постоянный цвет под Tab Bar.
*/

import SwiftUI

struct TabView_ToolbarBackgroundVisibility: View {
    var body: some View {
        TabView {
            
            Text("ToolbarBackground Visibility")
                // Показывает системный дефолтный фон TabBar (blur-эффект)
                .toolbarBackgroundVisibility(.visible, for: .tabBar)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            VStack {
                Text("ToolbarBackground Color")
            }
            // Добавляем свой цвет и делаем его всегда видимым
            .toolbarBackground(Color.teal.opacity(0.25), for: .tabBar)
            .toolbarBackgroundVisibility(.visible, for: .tabBar)
            .tabItem {
                Label("Message", systemImage: "envelope")
            }
        }
        .font(.title)
    }
}

#Preview {
    TabView_ToolbarBackgroundVisibility()
}
