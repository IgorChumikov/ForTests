//
//  TabBarMinimizeExample.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.03.2026.
//

import SwiftUI

/// Demonstrates tab bar minimization behavior.
/// The tab bar can recede when scrolling to elevate underlying content.
/// - .onScrollDown: minimizes when scrolling down
/// - .onScrollUp: minimizes when scrolling up
/// - .automatic: system decides
@available(iOS 26.0, *)
struct TabBarMinimizeExample: View {

    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(1...40, id: \.self) { index in
                            HStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.blue.opacity(0.15))
                                    .frame(width: 60, height: 60)
                                    .overlay {
                                        Image(systemName: "photo")
                                            .foregroundStyle(.blue)
                                    }

                                VStack(alignment: .leading) {
                                    Text("Пост \(index)")
                                        .font(.headline)
                                    Text("Прокрутите вниз, чтобы увидеть сворачивание панели вкладок")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }

                                Spacer()
                            }
                            .padding()
                            .background(.regularMaterial, in: .rect(cornerRadius: 12))
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                }
                .navigationTitle("Главная")
            }
            .tabItem {
                Label("Главная", systemImage: "house.fill")
            }
            .tag(0)

            NavigationStack {
                ContentUnavailableView(
                    "Поиск",
                    systemImage: "magnifyingglass",
                    description: Text("Поиск контента")
                )
                .navigationTitle("Поиск")
            }
            .tabItem {
                Label("Поиск", systemImage: "magnifyingglass")
            }
            .tag(1)

            NavigationStack {
                ContentUnavailableView(
                    "Профиль",
                    systemImage: "person.fill",
                    description: Text("Ваш профиль")
                )
                .navigationTitle("Профиль")
            }
            .tabItem {
                Label("Профиль", systemImage: "person.fill")
            }
            .tag(2)
        }
        .tabBarMinimizeBehavior(.onScrollDown)
    }
}

@available(iOS 26.0, *)
#Preview {
    TabBarMinimizeExample()
}
