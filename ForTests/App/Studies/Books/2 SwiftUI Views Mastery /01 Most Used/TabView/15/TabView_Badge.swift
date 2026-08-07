//
//  TabView_Badge.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 TabView — бейдж на вкладке (iOS 15+)
 
 • .badge(_:) добавляет числовой или текстовый индикатор на вкладку.
 • Цвет задаётся системой и не настраивается вручную.
 • Используется для уведомлений и количества непрочитанных элементов.
 */

import SwiftUI

struct TabView_Badge: View {
    var body: some View {
        TabView {
            Text("Phone Book Screen")
                .tabItem {
                    Label("Phone Book", systemImage: "book")
                }
            
            Text("History Screen")
                .tabItem {
                    Label("History", systemImage: "clock")
                }
                .badge(15) // показывает красный индикатор с числом
        }
        .font(.title)
    }
}

#Preview {
    TabView_Badge()
}
