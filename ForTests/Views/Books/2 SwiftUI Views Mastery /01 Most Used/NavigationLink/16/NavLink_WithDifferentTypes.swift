//
//  NavLink_WithDifferentTypes.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 NavigationLink + navigationDestination (iOS 16+)
 
 NavigationStack поддерживает несколько navigationDestination
для разных типов данных.
 
 Каждый `NavigationLink(value:)` ищет соответствующий `.navigationDestination(for:)`
с тем же типом, чтобы показать нужное представление.
 
 Это удобно при построении навигации с разными моделями данных (например, String, Bool, Enum).
 
 */

import SwiftUI

struct NavLink_WithDifferentTypes: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                // NavigationLink с типом String
                NavigationLink(value: "NavigationLink 1") {
                    Text("Navigate with String")
                }
                
                // NavigationLink с типом Bool
                NavigationLink(value: true) {
                    Text("Navigate with Bool")
                }
            }
            // Обработка переходов по типу String
            .navigationDestination(for: String.self) { stringValue in
                Text("Value is: ") + Text("\(stringValue)").bold()
            }
            // Обработка переходов по типу Bool
            .navigationDestination(for: Bool.self) { boolValue in
                Text("Value is: ") + Text("\(boolValue.description)").bold()
            }
            .navigationTitle("Navigation Destination")
        }
        .font(.title)
    }
}

#Preview {
    NavLink_WithDifferentTypes()
}
