//
//  Toolbar_BackgroundColor.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 TabView — фон для вкладки (iOS 13+)

 • Цвет задаётся внутри конкретной вкладки через ZStack.
 • .ignoresSafeArea() позволяет фону покрывать область под TabBar.
 • Фон не применяется ко всему TabView — только к выбранной вкладке.
*/

import SwiftUI

struct Toolbar_BackgroundColor: View {
    var body: some View {
        TabView {
            ZStack {
                Color.teal.opacity(0.2)
                    .ignoresSafeArea() // фон идёт под TabBar
                Text("Background Color")
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }

            Text("No Background Color")
                .tabItem {
                    Label("Message", systemImage: "envelope")
                }
        }
        .font(.title)
    }
}

#Preview {
    Toolbar_BackgroundColor()
}
