//
//  NavLink_WithNavigationDestination.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 NavigationLink + navigationDestination (iOS 16+)
 
 Вместо явного `destination:` можно передать `value:` — объект любого типа,
а затем объявить `.navigationDestination(for:)`, который будет реагировать
на этот тип данных и строить соответствующий экран.
 
 • NavigationLink с `value` сам по себе ничего не показывает —
   он лишь передаёт значение в `.navigationDestination(for:)`.
 • navigationDestination отвечает за отображение целевого экрана.
 • Тип значения (`String` в примере) должен совпадать с типом,
   указанным в `.navigationDestination(for:)`.
 
 */

import SwiftUI

struct NavLink_WithNavigationDestination: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                // NavigationLink с value вместо destination
                NavigationLink(value: "NavigationLink 1") {
                    Text("Navigate 1")
                }
                
                Text("""
                A NavigationLink that uses a value will not do anything by itself.
                It needs a matching navigationDestination modifier that handles the same type.
                """)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            }
            // Навигация по типу String
            .navigationDestination(for: String.self) { stringValue in
                VStack {
                    Text("Value is: ") + Text("\(stringValue)").bold()
                }
                .font(.title2)
            }
            .navigationTitle("Navigation Destination")
        }
        .font(.title)
    }
}

#Preview {
    NavLink_WithNavigationDestination()
}
