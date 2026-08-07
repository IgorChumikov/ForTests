//
//  Navigation_CustomBackButton.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 Кастомная кнопка «Назад» в NavigationStack (iOS 16+).

 • `.navigationBarBackButtonHidden(true)` — скрывает системную кнопку.
 • Через `.toolbar` + `.topBarLeading` можно добавить свою кнопку.
 • `@Environment(\.dismiss)` используется для возврата назад.
 
 ⚠️ Системный тулбар не позволяет совместить текст и картинку
в стандартной кнопке — поэтому кастомную кнопку делают вручную.
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
