//
//  NavLink_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 NavigationLink (iOS 16+) используется для навигации к новому экрану
внутри `NavigationStack`.
 
 • Можно указать `destination:` прямо в инициализаторе.
 • Или использовать `label:` — тогда содержимое кнопки можно кастомизировать.
 
 NavigationLink работает только внутри `NavigationStack` или `NavigationSplitView`.
 
 */

import SwiftUI

struct NavLink_Intro: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                // Простой переход с текстом
                NavigationLink("Just Text", destination: SecondView())
                
                Text("Use NavigationLink to navigate to a new view inside a NavigationStack.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Кастомный label с иконкой
                NavigationLink {
                    SecondView()
                } label: {
                    Label("Label", systemImage: "doc.text.fill")
                }
            }
            .navigationTitle("NavigationLink")
        }
        .font(.title)
    }
}

// MARK: - Second Screen
struct SecondView: View {
    var body: some View {
        VStack {
            Text("View 2")
                .font(.largeTitle)
            
            Text("These are the basic implementations using just text or a label and a destination. The destination can be any view.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
        }
        .navigationTitle("Second View")
    }
}

#Preview {
    NavLink_Intro()
}
