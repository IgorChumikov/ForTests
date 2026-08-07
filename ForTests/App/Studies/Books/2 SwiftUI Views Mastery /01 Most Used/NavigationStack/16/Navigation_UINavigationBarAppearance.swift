//
//  Navigation_UINavigationBarAppearance.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 Начиная с iOS 16, можно использовать `UINavigationBarAppearance`
для глобальной настройки внешнего вида всех навигационных панелей в приложении.
 
 • Позволяет задать фон, цвет текста и тень навбара.
 • Работает и в SwiftUI через `UINavigationBar.appearance()`.
 • Используется для единообразного стиля во всех экранах.
 
 */

import SwiftUI

struct Navigation_UINavigationBarAppearance: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Use UINavigationBarAppearance to apply style/color to ALL navigation bars.")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
            }
            .navigationTitle("Appearance")
            .font(.title)
        }
        .onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor(Color.green.opacity(0.25))
            appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
            
            // Применяем для всех состояний
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
        }
    }
}

#Preview {
    Navigation_UINavigationBarAppearance()
}
