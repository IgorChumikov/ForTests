//
//  Navigation_CustomBackButton.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 NavigationStack (iOS 16+) позволяет скрыть системную кнопку "Назад"
и добавить собственную через `.toolbar { ... }`.
 
 • `.navigationBarBackButtonHidden(true)` — убирает стандартную кнопку.
 • `.toolbar` с `.topBarLeading` — добавляет кастомную кнопку слева.
 • В `ToolbarItem` можно использовать `Label` (текст + иконка).
 
 ⚠️ В iOS нельзя одновременно отобразить текст и картинку
в стандартной кнопке тулбара. Для этого нужно скрыть навбар
и сделать кнопку вручную внутри контента.
 
 */

import SwiftUI

// MARK: - First Screen
struct Navigation_CustomBackButton: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Go To Detail",
                           destination: Navigation_CustomBackButton_Detail())
                .font(.title)
                .padding()
                .navigationTitle("Navigation Views")
        }
    }
}

// MARK: - Second Screen
struct Navigation_CustomBackButton_Detail: View {
    @Environment(\.dismiss) var dismiss // управление возвратом назад
    
    var body: some View {
        VStack {
            Spacer()
        }
        .navigationTitle("Detail View")
        .navigationBarBackButtonHidden(true) // скрываем системную кнопку «Назад»
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss() // возвращаемся на предыдущий экран
                }) {
                    Label("Back", systemImage: "arrow.left.circle")
                }
            }
        }
    }
}

#Preview {
    Navigation_CustomBackButton()
}
