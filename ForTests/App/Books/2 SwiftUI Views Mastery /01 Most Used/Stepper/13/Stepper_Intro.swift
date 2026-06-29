//
//  Stepper_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 Stepper — базовое использование (iOS 13+)

 • Можно связать Stepper с @State переменной.
 • Или использовать onIncrement / onDecrement для выполнения действий.
 • Полезен для ввода числовых значений или управления количеством.
*/

import SwiftUI

struct Stepper_Intro: View {
    @State private var stepperValue = 1
    @State private var values = [0, 1]

    var body: some View {
        VStack(spacing: 20) {
            Text("Stepper")
                .font(.largeTitle)

            Text("Introduction")
                .font(.title)
                .foregroundStyle(.gray)

            Text("The Stepper can be bound to a variable like this:")

            // Привязка к переменной состояния
            Stepper(value: $stepperValue) {
                Text("Bound Stepper: \(stepperValue)")
            }
            .padding(.horizontal)

            Divider()

            Image(systemName: "bolt.fill")
                .font(.title)
                .foregroundStyle(.yellow)

            Text("Or you can run code on the increment and decrement events:")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundStyle(.white)
                .font(.title)

            // Пример с onIncrement / onDecrement
            Stepper(
                onIncrement: { self.values.append(self.values.count) },
                onDecrement: { if !self.values.isEmpty { self.values.removeLast() } }
            ) {
                Text("onIncrement and onDecrement")
            }
            .padding(.horizontal)

            // Отображение текущих значений
            HStack {
                ForEach(values, id: \.self) { value in
                    Image(systemName: "\(value).circle.fill")
                }
            }
            .font(.title)
            .foregroundStyle(.green)
        }
    }
}

#Preview {
    Stepper_Intro()
}
