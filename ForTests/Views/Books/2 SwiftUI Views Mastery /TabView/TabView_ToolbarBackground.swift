//
//  TabView_ToolbarBackground.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 TabView — управление фоном панели вкладок (iOS 16+)

 • .toolbarBackground(.visible, for: .tabBar) делает фон панели вкладок видимым.
 • Работает только при применении внутри содержимого Tab.
 • Для iOS 18+ рекомендуется использовать .toolbarBackgroundVisibility(_:) вместо этого.
*/

import SwiftUI

struct TabView_ToolbarBackground: View {
    var body: some View {
        TabView {
            // MARK: - Home Tab
            ZStack {
                Color.teal.opacity(0.2)
                    .ignoresSafeArea() // фон за TabBar

                Text("ToolbarBackground Visible")
            }
            // 👇 применяем фон именно К ЭТОМУ экрану
            .toolbarBackground(.visible, for: .tabBar)
            .tabItem {
                Label("Home", systemImage: "house")
            }

            // MARK: - Message Tab
            Text("ToolbarBackground Hidden")
                // 👇 фон скрыт
                .toolbarBackground(.hidden, for: .tabBar)
                .tabItem {
                    Label("Message", systemImage: "envelope")
                }
        }
        .font(.title)
    }
}

#Preview {
    TabView_ToolbarBackground()
}
