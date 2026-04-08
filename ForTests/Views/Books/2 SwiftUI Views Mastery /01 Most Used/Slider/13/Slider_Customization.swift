//
//  Slider_Customization.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 Slider — кастомизация внешнего вида (iOS 13+)

 • Цвет ползунка напрямую не меняется, но можно стилизовать фон и дорожку.
 • Используются модификаторы .background(), .tint(), .shadow(), Capsule().
 • .tint() доступен начиная с iOS 15.
*/

import SwiftUI

struct Slider_Customization: View {
    @State private var sliderValue = 0.5

    var body: some View {
        VStack(spacing: 40) {
            Text("Slider")
                .font(.largeTitle)

            Text("Customization")
                .font(.title)
                .foregroundStyle(.gray)

            Text("At the time of this writing, there isn't a way to color the thumb. But we can change the background color and apply some other modifiers.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundStyle(.black)

            // Вариант 1 — с оранжевым фоном и тенью
            Slider(value: $sliderValue)
                .padding(.horizontal, 10)
                .background(Color.orange.shadow(radius: 2))
                .padding(.horizontal)

            // Вариант 2 — изменение цвета активной дорожки (iOS 15+)
            Text("Use the accentColor modifier to change the color of the track.")
            Slider(value: $sliderValue)
                .padding(.horizontal)
                .tint(.orange)

            // Вариант 3 — оформление через формы
            Text("Using shapes and outlines.")
            Slider(value: $sliderValue)
                .padding(10)
                .background(Capsule().stroke(Color.orange, lineWidth: 2))
                .padding(.horizontal)

            // Вариант 4 — заливка Capsule и чёрный цвет дорожки
            Slider(value: $sliderValue)
                .padding(10)
                .background(Capsule().fill(Color.orange))
                .tint(.black)
                .padding(.horizontal)
        }
        .font(.title)
    }
}

#Preview {
    Slider_Customization()
}
