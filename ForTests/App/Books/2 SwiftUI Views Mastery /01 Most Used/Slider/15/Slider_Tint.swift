//
//  Slider_Tint.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 Slider — изменение цвета дорожки с помощью .tint() (iOS 15+)

 • Модификатор .tint() меняет цвет активной части трека.
 • Можно сочетать с метками minimumValueLabel и maximumValueLabel.
*/

import SwiftUI

struct Slider_Tint: View {
    @State private var sliderValue = 0.5

    var body: some View {
        VStack(spacing: 20) {
            Text("Slider")
                .font(.largeTitle)

            Text("Tint")
                .font(.title)
                .foregroundStyle(.gray)

            Text("Tint can also be used to change the color of the Slider's track.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.brown)
                .foregroundStyle(.black)

            // Слайдер с иконками и изменённым цветом дорожки
            Slider(value: $sliderValue,
                   minimumValueLabel: Image(systemName: "tortoise"),
                   maximumValueLabel: Image(systemName: "hare"),
                   label: {})
                .foregroundStyle(.green)
                .tint(.orange) // изменяет цвет активной части трека
                .padding()
        }
        .font(.title)
    }
}

#Preview {
    Slider_Tint()
}
