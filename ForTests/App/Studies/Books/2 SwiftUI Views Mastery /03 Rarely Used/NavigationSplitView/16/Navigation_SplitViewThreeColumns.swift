//
//  Navigation_SplitViewThreeColumns.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 NavigationSplitView (iOS 16+) поддерживает до **трёх колонок**:
 
 • **Sidebar** — левая панель навигации.
 • **Content** — средняя панель, обычно список или дополнительный уровень.
 • **Detail** — правая панель с основным контентом.
 
 Чтобы добавить третью колонку, используется дополнительное замыкание `content:` между `sidebar` и `detail`.
 
 */

import SwiftUI

struct Navigation_SplitViewThreeColumns: View {
    var body: some View {
        NavigationSplitView(columnVisibility: .constant(.all)) {
            Text("Sidebar")
                .navigationTitle("Sidebar")
        } content: {
            Text("Content")
                .navigationTitle("Content")
        } detail: {
            Text("Detail")
                .navigationTitle("Detail")
        }
        .font(.title)
    }
}

#Preview {
    Navigation_SplitViewThreeColumns()
}
