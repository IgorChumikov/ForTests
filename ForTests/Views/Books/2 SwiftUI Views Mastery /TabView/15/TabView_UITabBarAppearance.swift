//
//  TabView_UITabBarAppearance.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 UITabBarAppearance — настройка внешнего вида Tab Bar (iOS 15+)

 • Позволяет настраивать фон и эффект размытости панели вкладок.
 • standardAppearance — стиль панели по умолчанию.
 • scrollEdgeAppearance — применяется при прокрутке контента за TabBar.
 • Можно использовать UIBlurEffect для размытия и backgroundColor для цвета.
*/

import SwiftUI

struct TabView_UITabBarAppearance: View {
    var body: some View {
        TabView {
            VStack {
                Text("Home")
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }

            VStack {
                Text("Messages")
            }
            .tabItem {
                Label("Messages", systemImage: "envelope")
            }
        }
        .font(.title)
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.configureWithDefaultBackground()
            
            // ✅ Размытие + цвет подложки
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appearance.backgroundColor = UIColor(Color.green.opacity(0.2))
            
            // ✅ Применяем как для обычного, так и для прокручиваемого состояния
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

#Preview {
    TabView_UITabBarAppearance()
}
