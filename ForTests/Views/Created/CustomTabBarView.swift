//
//  CustomTabBarView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 19.05.2025.
//

import SwiftUI

struct CustomTabBarView: View {
    @State private var selectedTab: Tab = .main
    @State private var hasFavoritesUpdate: Bool = true

    enum Tab {
        case main
        case favorites
        case history
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Главное содержимое")
                .tabItem {
                    VStack {
                        Image(systemName: "briefcase.fill")
                            .foregroundColor(selectedTab == .main ? .purple : .gray)
                        Text("Главное")
                    }
                }
                .tag(Tab.main)

            Text("Избранное содержимое")
                .tabItem {
                    VStack {
                        ZStack {
                            Image(systemName: "star")
                            if hasFavoritesUpdate {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 8, height: 8)
                                    .offset(x: 10, y: -10)
                            }
                        }
                        Text("Избранное")
                    }
                }
                .tag(Tab.favorites)

            Text("История содержимого")
                .tabItem {
                    VStack {
                        Image(systemName: "clock.arrow.circlepath")
                        Text("История")
                    }
                }
                .tag(Tab.history)
        }
    }
}

#Preview {
    CustomTabBarView()
}
