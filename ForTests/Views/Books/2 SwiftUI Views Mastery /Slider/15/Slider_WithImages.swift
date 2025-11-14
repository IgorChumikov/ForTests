//
//  Slider_WithImages.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 Slider — с изображениями и метками (iOS 15+)

 • Добавлены параметры minimumValueLabel и maximumValueLabel.
 • Можно использовать текст или изображения.
 • Подходит для создания наглядных индикаторов диапазона (скорость, громкость и т.д.).
*/

import SwiftUI

struct Slider_WithImages: View {
    @State private var sliderValue = 0.5

    var body: some View {
        VStack(spacing: 20) {
            Text("Slider")
                .font(.largeTitle)

            Text("With Images")
                .font(.title)
                .foregroundStyle(.gray)

            Text("Combine the slider with images or values.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundStyle(.black)

            // Вариант 1 — иконки по краям
            Slider(value: $sliderValue,
                   minimumValueLabel: Image(systemName: "tortoise"),
                   maximumValueLabel: Image(systemName: "hare"),
                   label: {})
                .foregroundStyle(.green)
                .padding()

            // Вариант 2 — текстовые метки
            Slider(value: $sliderValue,
                   minimumValueLabel: Text("0"),
                   maximumValueLabel: Text("1"),
                   label: {})
                .padding()

            // Вариант 3 — с дополнительными иконками
            VStack {
                Slider(value: $sliderValue)
                    .tint(.orange)

                HStack {
                    Image(systemName: "circle")
                    Spacer()
                    Image(systemName: "circle.righthalf.fill")
                    Spacer()
                    Image(systemName: "circle.fill")
                }
                .foregroundStyle(.orange)
                .padding(.top, 8)
            }
            .padding()
        }
        .font(.title)
    }
}

#Preview {
    Slider_WithImages()
}
