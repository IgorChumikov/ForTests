//
//  Navigation_BackButtonHidden.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 NavigationStack (iOS 16+) поддерживает скрытие стандартной кнопки «Назад»
с помощью `.navigationBarBackButtonHidden(true)`.
 
 Это полезно, если нужно создать собственную кнопку возврата
или добавить дополнительную логику при переходе назад.
 
 Для навигации между экранами используется `NavigationLink`.
 А чтобы вернуться — `@Environment(\.dismiss)`.
 
 */

import SwiftUI

// MARK: - First Screen
struct Navigation_BackButtonHidden: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Go To Detail", destination: BackButtonHiddenDetail())
                .font(.title)
                .padding()
                .navigationTitle("Navigation Views")
        }
    }
}

// MARK: - Second Screen
struct BackButtonHiddenDetail: View {
    @Environment(\.dismiss) var dismiss // позволяет закрыть текущий экран
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Go Back") {
                dismiss() // навигация назад
            }
            .font(.title)
            
            Text("Dismissing what is being presented will navigate you back to the previous screen.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .navigationTitle("Detail View")
        .navigationBarBackButtonHidden(true) // скрываем стандартную кнопку «Назад»
    }
}

#Preview {
    Navigation_BackButtonHidden()
}
