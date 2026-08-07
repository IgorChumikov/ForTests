//
//  TabView_TooManyTabs.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

import SwiftUI

/*
 TabView — слишком много вкладок (iOS 13+)

 • Если вкладок больше, чем помещается на экране, появляется кнопка "More".
 • Остальные вкладки отображаются внутри списка "More".
 • Работает аналогично UITabBarController.
*/

import SwiftUI

struct TabView_TooManyTabs: View {
    var body: some View {
        TabView {
            Text("Call Screen")
                .tabItem {
                    Label("Call", systemImage: "phone")
                }

            Text("Outgoing Phone Calls Screen")
                .tabItem {
                    Label("Outgoing", systemImage: "phone.arrow.up.right")
                }

            Text("Incoming Phone Calls Screen")
                .tabItem {
                    Label("Incoming", systemImage: "phone.arrow.down.left")
                }

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
    }
}

#Preview {
    TabView_TooManyTabs()
}
