//
//  Text_MeasurementConversion.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 Text — принудительная конверсия единиц измерения (iOS 15+)

 • Параметр usage: .asProvided позволяет зафиксировать нужную единицу измерения.
 • Используется, если SwiftUI по умолчанию выбирает другую единицу (например, мили вместо футов).
*/

import SwiftUI

struct Text_MeasurementConversion: View {

    @State private var marathon = Measurement(value: 26.2, unit: UnitLength.miles)

    var body: some View {
        VStack(spacing: 24) {
            // Отображение по умолчанию
            Text(marathon, format: .measurement(width: .wide)) // 26 miles

            // Принудительно конвертируем в футы
            Text(marathon.converted(to: .feet), format: .measurement(width: .wide))
            // всё ещё может отобразиться в милях, если локаль конвертирует обратно

            // Принудительно фиксируем единицы — только футы
            Text(marathon.converted(to: .feet),
                 format: .measurement(width: .wide, usage: .asProvided))
            // → 138,336 feet
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Text_MeasurementConversion()
}
