//
//  Text_Measurement.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 Text — форматирование измерений (iOS 15+)

 • Используем параметр format: .measurement(width:usage:) для вывода значений Measurement.
 • Можно контролировать ширину отображения (узкий, краткий, полный).
 • По умолчанию формат локализуется в зависимости от текущей Locale.
*/

import SwiftUI

struct Text_Measurement: View {

    @State private var marathon = Measurement(value: 26.2, unit: UnitLength.miles)
    @State private var height = Measurement(value: 2, unit: UnitLength.meters)
    @State private var temperature = Measurement(value: 30, unit: UnitTemperature.celsius)

    var body: some View {
        VStack(spacing: 10) {
            HeaderView3(
                title: "Text",
                subtitle: "Measurement",
                desc: "Use the format parameter with different types such as Measurement.",
                back: .green,
                textColor: .white
            )

            // --- Разные степени ширины отображения ---
            Text(marathon, format: .measurement(width: .narrow))       // 26mi
            Text(marathon, format: .measurement(width: .abbreviated))  // 26 mi
            Text(marathon, format: .measurement(width: .wide))         // 26 miles

            // --- Автоматическая локализация по умолчанию ---
            DescView2(desc: "The format is also locale-aware by default.", back: .green, textColor: .red)
            Text(height, format: .measurement(width: .wide))           // 6.6 feet (в США) / 2 метра (в RU)
            Text(temperature, format: .measurement(width: .abbreviated)) // 86°F (в США)

            // --- Принудительное использование единиц (отключаем auto-localization) ---
            DescView2(desc: "Specify usage to prevent locale-aware.", back: .green, textColor: .red)
            Text(height, format: .measurement(width: .wide, usage: .asProvided)) // всегда метры
            Text(temperature, format: .measurement(width: .abbreviated, usage: .asProvided)) // всегда °C
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Text_Measurement()
}
