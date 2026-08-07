//
//  NavLink_PopToRoot.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 NavigationStack (iOS 16+) позволяет программно "вернуться к корню" —
удалить все экраны из навигационного стека и показать только первый экран.
 
 Это называется “Pop to Root”.
 
 • "Root" — первый экран стека навигации.
 • "Pop" — удаление всех представлений сверху.
 • Чтобы это работало, `navPath` должен быть доступен всем дочерним вью.
 
 В этом примере `navPath` передаётся через Binding в дочерние экраны,
которые могут вызвать `navPath.removeAll()` для возврата к корневому экрану.
 
 */

import SwiftUI

// MARK: - Основной экран
struct NavLink_PopToRoot: View {
    @State private var navPath: [String] = []
    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack(spacing: 20) {
                NavigationLink(value: "View 2") {
                    Text("Go to View 2")
                        .padding()
                }
            }
            .navigationTitle("Pop to Root")
            .navigationDestination(for: String.self) { pathValue in
                if pathValue == "View 2" {
                    NavLinkView2(navPath: $navPath)
                } else {
                    NavLinkView3(navPath: $navPath)
                }
            }
        }
        .font(.title)
    }
}

// MARK: - Второй экран
struct NavLinkView2: View {
    @Binding var navPath: [String]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("View 2")
                .font(.largeTitle)
            
            NavigationLink(value: "View 3") {
                Text("Go to View 3")
            }
            
            Button("Pop to Root") {
                navPath.removeAll()
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
        .navigationTitle("Second View")
    }
}

// MARK: - Третий экран
struct NavLinkView3: View {
    @Binding var navPath: [String]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("View 3")
                .font(.largeTitle)
            
            Button("Pop to Root") {
                navPath.removeAll()
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
        }
        .navigationTitle("Third View")
    }
}

#Preview {
    NavLink_PopToRoot()
}
