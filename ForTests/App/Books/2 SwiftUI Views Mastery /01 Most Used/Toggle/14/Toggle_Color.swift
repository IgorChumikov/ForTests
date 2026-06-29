//
//  Toggle_Color.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 Toggle — изменение цвета (iOS 14+)

 • Цвет задаётся через SwitchToggleStyle(tint:).
 • Можно использовать любой SwiftUI Color или кастомные значения.
 • Поддерживается для системного SwitchToggleStyle.
*/

import SwiftUI

struct Toggle_Color: View {
    // MARK: - Properties
    @State private var isToggleOn = true

    // MARK: - Body
    var body: some View {
        VStack(spacing: 40) {
            HeaderView3(
                title: "Toggle",
                subtitle: "Color",
                desc: "You can change the color of the Toggle through the SwitchToggleStyle.",
                back: .blue,
                textColor: .white
            )

            Group {
                // MARK: - Красный переключатель
                Toggle(isOn: $isToggleOn) {
                    Label("Red", systemImage: "paintpalette")
                }
                .toggleStyle(SwitchToggleStyle(tint: .red))

                // MARK: - Оранжевый переключатель
                Toggle(isOn: $isToggleOn) {
                    Label("Orange", systemImage: "paintpalette")
                }
                .toggleStyle(SwitchToggleStyle(tint: .orange))
            }
            .padding(.horizontal)
        }
        .font(.title3)
    }
}

#Preview {
    Toggle_Color()
}
