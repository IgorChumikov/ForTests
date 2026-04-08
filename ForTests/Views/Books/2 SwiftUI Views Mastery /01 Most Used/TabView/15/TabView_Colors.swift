//
//  TabView_Colors.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 TabView — настройка цвета активной вкладки (iOS 15+)

 • Модификатор .tint(_:) задаёт цвет активного таба.
 • Цвет применяется к иконке и тексту выбранной вкладки.
*/

import SwiftUI

struct TabView_Colors: View {
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

            Text("New Phone Number")
                .tabItem {
                    Label("New", systemImage: "phone.badge.plus")
                }
        }
        .font(.title)
        .tint(.yellow) // iOS 15+
    }
}

#Preview {
    TabView_Colors()
}
