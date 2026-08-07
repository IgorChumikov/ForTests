//
//  Navigation_SplitViewColumnWidth.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 NavigationSplitView (iOS 16+) позволяет задавать ширину каждой колонки
с помощью модификатора `.navigationSplitViewColumnWidth(...)`.
 
 • Можно указать фиксированную ширину (`.navigationSplitViewColumnWidth(200)`)
   или диапазон (`min:ideal:max:`).
 • Модификатор применяется к содержимому конкретной колонки.
 
 Также можно настроить стиль отображения с помощью `.navigationSplitViewStyle(...)`:
   • `.automatic` — система сама подбирает ширины.
   • `.balanced` — сбалансированный вид между колонками (используется по умолчанию).
   • `.prominentDetail` — отдаёт больше пространства Detail-области.
 
 */

import SwiftUI

struct Navigation_SplitViewColumnWidth: View {
    var body: some View {
        NavigationSplitView(columnVisibility: .constant(.all)) {
            // Sidebar
            Text("Sidebar")
                .navigationSplitViewColumnWidth(120)
                .navigationTitle("Sidebar")
        } content: {
            // Content
            Text("Content")
                .navigationSplitViewColumnWidth(min: 400, ideal: 500, max: 500)
                .navigationTitle("Content")
        } detail: {
            // Detail
            Text("Detail")
                .navigationSplitViewColumnWidth(200)
                .navigationTitle("Detail")
        }
        .navigationSplitViewStyle(.balanced) // стиль баланса колонок
        .font(.title)
    }
}

#Preview {
    Navigation_SplitViewColumnWidth()
}
