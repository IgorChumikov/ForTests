//
//  Slider_RangeOfValues.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 Slider — задание диапазона значений (iOS 13+)

 • Можно указать собственные min/max значения с помощью параметра in:.
 • Параметр step задаёт шаг изменения.
 • Использование NumberFormatter позволяет форматировать значение (например, словами).
*/

import SwiftUI

struct Slider_RangeOfValues: View {
    @State private var age = 18.0

    // Форматтер для вывода числа словами
    let ageFormatter: NumberFormatter = {
        let numFormatter = NumberFormatter()
        numFormatter.numberStyle = .spellOut
        return numFormatter
    }()

    var body: some View {
        VStack(spacing: 40) {
            Text("Slider")
                .font(.largeTitle)

            Text("Range of Values")
                .font(.title)
                .foregroundStyle(.gray)

            Text("You can also set your own min and max values.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundStyle(Color.black)

            Text("What is your age?")

            // Слайдер с диапазоном 1...100 и шагом 1
            Slider(value: $age, in: 1...100, step: 1)
                .padding(.horizontal)

            // Выводим значение текста словами
            Text("Age is: \(ageFormatter.string(from: NSNumber(value: age))!)")
                .foregroundStyle(.orange)
        }
        .font(.title)
    }
}

#Preview {
    Slider_RangeOfValues()
}
