//
//  NavLink_IsDetailLink.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 iPad
 
 NavigationSplitView (iOS 16+) поддерживает модификатор `.isDetailLink(_:)`,
который управляет тем, **в какой колонке** будет открыт `NavigationLink`.

 • По умолчанию (`true`) — переход происходит в **Detail-колонку** (правую часть SplitView).
 • Если установить `.isDetailLink(false)` — переход произойдёт **в ту же колонку**,
   где находится сам `NavigationLink`.

 Это полезно, если вы хотите, чтобы навигация происходила **в рамках Sidebar**,
а не открывала новый экран справа.

 */

import SwiftUI

struct NavLink_IsDetailLink: View {
    var body: some View {
        NavigationSplitView {
            VStack(spacing: 20) {
                
                // По умолчанию — переход в колонку Detail
                NavigationLink("Navigate There →") {
                    NavigationDestinationView()
                }
                
                Text("By default, a NavigationLink will navigate to the detail column.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Переход в ту же колонку (isDetailLink = false)
                NavigationLink("Navigate Here") {
                    NavigationDestinationView()
                }
                .isDetailLink(false) // навигация в ту же колонку
                
                Text("Use isDetailLink(false) to stay in the same column.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            .navigationTitle("NavigationLink")
        } detail: {
            Text("Detail")
                .font(.largeTitle)
        }
        .font(.title)
    }
}

// MARK: - Целевой экран
struct NavigationDestinationView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Navigation Destination")
                .font(.largeTitle)
            
            Text("""
            • If `.isDetailLink(true)` (по умолчанию), экран откроется в Detail-колонке.
            • Если `.isDetailLink(false)`, экран откроется в той же колонке.
            """)
            .font(.body)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
        }
        .navigationTitle("Destination")
        .font(.title)
    }
}

#Preview {
    NavLink_IsDetailLink()
}
