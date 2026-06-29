//
//  Navigation_SplitViewColumnVisibility.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 NavigationSplitView (iOS 16+) поддерживает параметр `columnVisibility`,
который позволяет программно управлять отображением колонок —
например, показывать или скрывать **Sidebar**.
 
 Значения:
 • `.all` — показывает и Sidebar, и Detail.
 • `.detailOnly` — скрывает Sidebar, оставляя только основное содержимое.
 • `.automatic` — система сама выбирает конфигурацию в зависимости от устройства.
 
 */

import SwiftUI

struct Navigation_SplitViewColumnVisibility: View {
    @State private var visibility = NavigationSplitViewVisibility.all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            Text("Sidebar")
                .navigationTitle("Sidebar")
        } detail: {
            VStack(spacing: 20) {
                Text("Detail")
                Button("Show Sidebar") {
                    visibility = .all // показываем боковую панель программно
                }
            }
            .font(.title)
        }
    }
}

#Preview {
    Navigation_SplitViewColumnVisibility()
}
