//
//  TabView_Background_Scrolling.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 TabView — фон при прокрутке контента (iOS 15+)

 • .scrollContentBackground(.hidden) скрывает системный фон списка.
 • .background(...) задаёт собственный цвет или прозрачность.
 • Работает только, если контент (например, List) прокручивается за Tab Bar.
*/

import SwiftUI

struct TabView_Background_Scrolling: View {
    var body: some View {
        TabView {
            // MARK: - Home tab
            List(0..<7) { item in
                Text("Row \(item)")
                    .padding()
            }
            .scrollContentBackground(.hidden) // скрывает системный blur под списком
            .background(Color.teal.opacity(0.2)) // задаёт свой фон под TabBar
            .tabItem {
                Label("Home", systemImage: "house")
            }

            // MARK: - Message tab
            Text("No Background Color")
                .tabItem {
                    Label("Message", systemImage: "envelope")
                }
        }
        .font(.title)
    }
}

#Preview {
    TabView_Background_Scrolling()
}
