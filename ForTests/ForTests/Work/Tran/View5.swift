//
//  View5.swift
//  ForTests
//
//  Created by Игорь Чумиков on 11.06.2024.
//

import SwiftUI

class NavigationStackManager: ObservableObject {
    @Published var activeView: Int = 0
}

struct View5: View {
    @StateObject private var navigationStackManager = NavigationStackManager()
    
    var body: some View {
        NavigationView {
            VStack {
                switch navigationStackManager.activeView {
                case 0:
                    Button("Переход на View5_1") {
                        navigationStackManager.activeView = 1
                    }
                    .navigationTitle("View5")
                case 1:
                    View5_1()
                case 2:
                    View5_2()
                case 3:
                    View5_3()
                case 4:
                    View5_4()
                default:
                    EmptyView()
                }
            }
        }
        .environmentObject(navigationStackManager)
        .animation(
            Animation.easeInOut,
            value: navigationStackManager.activeView
        )
    }
}

struct View5_1: View {
    @EnvironmentObject var navigationStackManager: NavigationStackManager
    
    var body: some View {
        VStack {
            Button("Переход на View5_2") {
                navigationStackManager.activeView = 2
            }
        }
        .navigationTitle("View5_1")
        .onAppear {
            navigationStackManager.activeView = 1
        }
    }
}

struct View5_2: View {
    @EnvironmentObject var navigationStackManager: NavigationStackManager
    
    var body: some View {
        VStack {
            Button("Переход на View5_3") {
                navigationStackManager.activeView = 3
            }
        }
        .navigationTitle("View5_2")
        .onAppear {
            navigationStackManager.activeView = 2
        }
    }
}

struct View5_3: View {
    @EnvironmentObject var navigationStackManager: NavigationStackManager
    
    var body: some View {
        VStack {
            Button("Переход на View5_4") {
                navigationStackManager.activeView = 4
            }
        }
        .navigationTitle("View5_3")
        .onAppear {
            navigationStackManager.activeView = 3
        }
    }
}

struct View5_4: View {
    @EnvironmentObject var navigationStackManager: NavigationStackManager
    
    var body: some View {
        VStack {
            Text("Это View5_4")
            Button("На главный экран") {
                navigationStackManager.activeView = 0
            }
        }
        .navigationTitle("View5_4")
        .onAppear {
            navigationStackManager.activeView = 4
        }
    }
}

#Preview {
    View5()
}
