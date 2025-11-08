//
//  Slider_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 Slider — базовое использование (iOS 13+)

 • Позволяет выбирать значение в диапазоне (по умолчанию 0.0...1.0).
 • Требует привязки к @State-переменной.
 • Значение обновляется в реальном времени при перемещении ползунка.
*/

import SwiftUI

struct Slider_Intro: View {
    @State private var sliderValue = 0.5

    var body: some View {
        VStack(spacing: 40) {
            Text("Slider")
                .font(.largeTitle)

            Text("Introduction")
                .font(.title)
                .foregroundStyle(.gray)

            Text("Associate the Slider with an @State variable that will control where the thumb (circle) will be on the slider's track.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundStyle(Color.black)

            Text("Default min value is 0.0 and max value is 1.0")

            Slider(value: $sliderValue)
                .padding(.horizontal)

            Text("Value is: \(sliderValue)")
                .foregroundStyle(.orange)
        }
        .font(.title)
    }
}

#Preview {
    Slider_Intro()
}
