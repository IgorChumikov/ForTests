//
//  Navigation_CustomBackground.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 Начиная с iOS 16, можно использовать `.background(_:ignoresSafeAreaEdges:)`
для задания кастомного фона, который автоматически игнорирует безопасные зоны.
 
 Это позволяет, например, создать собственный фон для навигационной панели,
растягивая цвет или градиент под неё.
 
 • `.ignoresSafeAreaEdges:` — задаёт, какие края должны быть проигнорированы.
   По умолчанию игнорируются все края.
 
 */

import SwiftUI

struct Navigation_CustomBackground: View {
    var body: some View {
        NavigationStack {
            VStack {
                Divider()
                    .background(
                        LinearGradient(
                            colors: [.green, .blue],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .opacity(0.5)
                        .shadow(.drop(radius: 2, y: 2)),
                        ignoresSafeAreaEdges: .top
                    )
                
                Spacer()
            }
            .navigationTitle("Custom Background")
        }
    }
}

#Preview {
    Navigation_CustomBackground()
}
