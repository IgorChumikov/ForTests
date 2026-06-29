//
//  CustomTabBarExampleContentView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.08.2025.
//


import SwiftUI

struct CustomTabBarExampleContentView: View {
    
    // MARK: - Properties
    @State private var selectedTab: Tab2 = .home
    
    // MARK: - Body
    var body: some View {
        ZStack {
            // Main content
            TabView(selection: $selectedTab) {
                NavigationStack {
                    Home2()
                }
                .tag(Tab.home)
                
                NavigationStack {
                    Search()
                }
                .tag(Tab2.search)
                
                NavigationStack {
                    Notifications()
                }
                .tag(Tab2.notifications)
                
                NavigationStack {
                    Settings()
                }
                .tag(Tab2.settings)
            }
            .toolbar(.hidden, for: .tabBar) // Hide system tab bar
            
            // Custom tab bar
            VStack {
                Spacer()
                customTabBar
            }
        }
    }
    
    // MARK: - Custom TabBar
    private var customTabBar: some View {
        HStack {
            tabBarButton(tab: .home, icon: "homekit", title: "Home")
            tabBarButton(tab: .search, icon: "sparkle.magnifyingglass", title: "Search")
            tabBarButton(tab: .notifications, icon: "bell.badge.fill", title: "Notification")
            tabBarButton(tab: .settings, icon: "gear.circle", title: "Settings")
        }
        .padding()
        .frame(height: 72)
        .background {
            RoundedRectangle(cornerRadius: 36)
                .fill(
                    RadialGradient(
                        gradient: Gradient(colors: [.blue, .black]),
                        center: .center,
                        startRadius: 2,
                        endRadius: 350
                    )
                )
                .shadow(color: .black.opacity(0.5), radius: 8, y: 2)
        }
        .padding(.horizontal)
    }
    
    // MARK: - Tab Bar Button
    private func tabBarButton(tab: Tab2, icon: String, title: String) -> some View {
        Button(action: {
            withAnimation {
                selectedTab = tab
            }
        }) {
            VStack {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                if selectedTab == tab {
                    Text(title)
                        .font(.system(size: 11))
                }
            }
            .foregroundStyle(selectedTab == tab ? Color.primary : Color.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    CustomTabBarExampleContentView()
}


struct Home2: View {
    var body: some View {
        VStack {
            Text("🏠 Home")
                .font(.largeTitle)
        }
        .navigationTitle("Home")
    }
}

struct Search: View {
    var body: some View {
        VStack {
            Text("🔍 Search")
                .font(.largeTitle)
        }
        .navigationTitle("Search")
    }
}

struct Notifications: View {
    var body: some View {
        VStack {
            Text("🔔 Notifications")
                .font(.largeTitle)
        }
        .navigationTitle("Notifications")
    }
}

struct Settings: View {
    var body: some View {
        VStack {
            Text("⚙️ Settings")
                .font(.largeTitle)
        }
        .navigationTitle("Settings")
    }
}


enum Tab2 {
    case home
    case search
    case notifications
    case settings
}
