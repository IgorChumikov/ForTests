//
//  Toggle_ToggleStyle.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 Toggle — применение toggleStyle(.button) (iOS 15+)

 • Позволяет превратить Toggle в кнопку с двумя состояниями.
 • Использует .symbolVariant(.fill) для визуального переключения иконки.
 • Отлично подходит для лайков, избранного и т.д.
*/

import SwiftUI

struct Toggle_ToggleStyle: View {
    // MARK: - Properties
    @State private var isOn = false
    @State private var toggleOn = true

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            HeaderView3(
                title: "Toggle",
                subtitle: "ToggleStyle",
                desc: "Apply the toggleStyle to your Toggle to make it look like a button with two states.",
                back: .brown,
                textColor: .white
            )

            // MARK: - Простой toggle без стиля
            Toggle(isOn: $isOn) {
                Image(systemName: "heart")
                    .symbolVariant(isOn ? .fill : .none)
            }
            .padding()

            // MARK: - Toggle с .button стилем
            Toggle(isOn: $isOn) {
                Image(systemName: "heart")
                    .symbolVariant(isOn ? .fill : .none)
            }
            .toggleStyle(.button)

            // MARK: - Второй toggle (включен по умолчанию)
            Toggle(isOn: $toggleOn) {
                Image(systemName: "heart")
                    .symbolVariant(toggleOn ? .fill : .none)
            }
            .toggleStyle(.button)
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Toggle_ToggleStyle()
}
