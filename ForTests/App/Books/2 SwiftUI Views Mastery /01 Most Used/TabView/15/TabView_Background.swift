//
//  TabView_Background.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 TabView — фон с контролем Safe Area (iOS 15+)

 • .background() по умолчанию игнорирует Safe Area и может заходить под TabBar.
 • Чтобы ограничить область, используйте .ignoresSafeAreaEdges(.top) или .bottom.
 • Можно применять материалы размытости, например .ultraThinMaterial.
*/

import SwiftUI

struct TabView_Background: View {
    var body: some View {
        TabView {
            VStack {
                Text("Home")
                Spacer()
                Divider()
            }
            // ✅ Материальный фон (размытый), но не уходит под TabBar
            .background(.ultraThinMaterial, ignoresSafeAreaEdges: [.top])
            .tabItem {
                Label("Home", systemImage: "house")
            }

            VStack {
                Text("Messages")
                Spacer()
                Divider()
            }
            // ✅ Кастомный цвет, который не лезет под нижний TabBar
            .background(Color.brown.opacity(0.5), ignoresSafeAreaEdges: [.top])
            .tabItem {
                Label("Message", systemImage: "envelope")
            }
        }
        .font(.title)
    }
}

#Preview {
    TabView_Background()
}
