//
//  Slider_InMenu.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 Slider — использование внутри Menu (iOS 15+)

 • Слайдер в Menu ведёт себя как Stepper.
 • Можно задавать шаг изменения (step:) и диапазон (in:).
 • Иконки в minimumValueLabel и maximumValueLabel становятся кнопками ±.
*/

import SwiftUI

struct Slider_InMenu: View {
    @State private var count = 1.0
    @State private var speed = 5.0

    var body: some View {
        Menu("Slider in Menu") {
            // Первый слайдер — с числовыми значениями
            Slider(value: $count, in: 1...10, step: 1) {
                Text("Count: \(count, format: .number)")
                    .font(.title)
            }

            // Второй слайдер — с иконками и подписями
            Slider(value: $speed, in: 1...10, step: 1,
                   minimumValueLabel: Image(systemName: "tortoise"),
                   maximumValueLabel: Image(systemName: "hare"),
                   label: {
                       Text("Speed: \(speed, format: .number)")
                   })
            .foregroundStyle(.green)
            .padding()
        }
        .font(.title)
        .menuOrder(.fixed)
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    Slider_InMenu()
}
