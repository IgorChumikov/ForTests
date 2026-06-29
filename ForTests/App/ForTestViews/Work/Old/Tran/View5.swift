//
//  View5.swift
//  ForTests
//
//  Created by Игорь Чумиков on 11.06.2024.
//

import SwiftUI

enum ActiveView {
    case main, view1, view2, view3, view4
}

class NavigationStackManager: ObservableObject {
    @Published var activeView: ActiveView = .main
}

struct View5: View {
    @StateObject private var navigationStackManager = NavigationStackManager()
    
    var body: some View {
        VStack {
            switch navigationStackManager.activeView {
            case .main:
                Button("Переход на View5_1") {
                    navigationStackManager.activeView = .view1
                }
                .navigationTitle("View5")
            case .view1:
                View5_1()
            case .view2:
                View5_2()
            case .view3:
                View5_3()
            case .view4:
                View5_4()
            }
        }
        .navigationBarBackButtonHidden(true)
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
        ZStack {
            Color.red.ignoresSafeArea()
            VStack {
                Button("Переход на View5_2") {
                    navigationStackManager.activeView = .view2
                }
            }
            .navigationTitle("View5_1")
            .onAppear {
                navigationStackManager.activeView = .view1
            }
        }
    }
}

struct View5_2: View {
    @EnvironmentObject var navigationStackManager: NavigationStackManager
    
    var body: some View {
        ZStack {
            Color.brown.ignoresSafeArea()
            VStack {
                Button("Переход на View5_3") {
                    navigationStackManager.activeView = .view3
                }
            }
            .navigationTitle("View5_2")
            .onAppear {
                navigationStackManager.activeView = .view2
            }
        }
    }
}

struct View5_3: View {
    @EnvironmentObject var navigationStackManager: NavigationStackManager
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            VStack {
                Button("Переход на View5_4") {
                    navigationStackManager.activeView = .view4
                }
            }
            .navigationTitle("View5_3")
            .onAppear {
                navigationStackManager.activeView = .view3
            }
        }
    }
}

struct View5_4: View {
    @EnvironmentObject var navigationStackManager: NavigationStackManager
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack {
                Text("Это View5_4")
                Button("Закрыть") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationTitle("View5_4")
            .onAppear {
                navigationStackManager.activeView = .view4
            }
        }
    }
}


#Preview {
    View5()
}
