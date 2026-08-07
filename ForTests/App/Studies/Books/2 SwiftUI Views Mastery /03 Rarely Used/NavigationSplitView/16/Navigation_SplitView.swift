//
//  Navigation_SplitView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 NavigationSplitView (iOS 16+) используется для построения адаптивных интерфейсов
с разделением на **Sidebar** (боковую панель) и **Detail** (основное содержимое).
 
 Это замена старому `NavigationView` в стиле split (iPad/macOS).
 
 • Первый замыкатель — это боковая панель (sidebar).
 • Второй — область контента (detail).
 
 Можно применять почти все модификаторы `NavigationStack`
к `NavigationSplitView` (например, `.navigationTitle`, `.toolbar`, и т.д.).
 
 */

import SwiftUI

struct Navigation_SplitView: View {
    var body: some View {
        NavigationSplitView {
            Text("Sidebar")
                .navigationTitle("NavigationSplitView")
        } detail: {
            Text("Detail")
                .font(.title)
        }
    }
}

#Preview {
    Navigation_SplitView()
}
