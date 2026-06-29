//
//  Toggle_Tint.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 Toggle — использование .tint() (iOS 15+)

 • Начиная с iOS 15 можно напрямую изменять цвет через .tint().
 • Работает для всех стандартных Toggle без кастомных стилей.
 • Можно использовать системные и кастомные цвета.
*/

import SwiftUI

struct Toggle_Tint: View {
    // MARK: - Properties
    @State private var isToggleOn = true

    // MARK: - Body
    var body: some View {
        VStack(spacing: 40) {
            HeaderView3(
                title: "Toggle",
                subtitle: "Tint",
                desc: "Starting in iOS 15, you can use the tint modifier to change the color.",
                back: .brown,
                textColor: .white
            )

            Group {
                Toggle(isOn: $isToggleOn) {
                    Label("Red", systemImage: "paintpalette")
                }
                .tint(.red)

                Toggle(isOn: $isToggleOn) {
                    Label("Orange", systemImage: "paintpalette")
                }
                .tint(.orange)
            }
            .padding(.horizontal)
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    Toggle_Tint()
}
