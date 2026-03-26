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
                                    Text("Post \(index)")
                                        .font(.headline)
                                    Text("Scroll to see the tab bar minimize")
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
                .navigationTitle("Home")
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            .tag(0)

            NavigationStack {
                ContentUnavailableView(
                    "Search",
                    systemImage: "magnifyingglass",
                    description: Text("Search for content")
                )
                .navigationTitle("Search")
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            .tag(1)

            NavigationStack {
                ContentUnavailableView(
                    "Profile",
                    systemImage: "person.fill",
                    description: Text("Your profile")
                )
                .navigationTitle("Profile")
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
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
