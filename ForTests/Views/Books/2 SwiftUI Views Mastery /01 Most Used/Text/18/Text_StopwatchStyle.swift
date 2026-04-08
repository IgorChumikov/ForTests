//
//  Text_StopwatchStyle.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

//
//  Text_StopwatchStyle.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 Text — формат секундомера (iOS 18+)

 • Новый форматер .stopwatch(startingAt:) показывает разницу между двумя датами как таймер.
 • Можно ограничить количество отображаемых единиц времени с помощью maxFieldCount.
 • Параметр showsHours управляет тем, отображаются ли часы.
 • Удобно для отображения интервалов: “2:11:00”, “2 hours”, “131 minutes”.
*/

import SwiftUI

struct Text_StopwatchStyle: View {
    // MARK: - Properties
    @State private var currentDate = Date()                                 // Текущая дата
    @State private var futureDate = Date().addingTimeInterval(131 * 60)     // Через 131 минуту

    // MARK: - Body
    var body: some View {
        VStack(spacing: 24) {
            // Полный формат с часами, минутами и секундами
            Text(futureDate, format: .stopwatch(startingAt: currentDate))
            
            // Только одно поле — часы
            Text(futureDate, format: .stopwatch(startingAt: currentDate, maxFieldCount: 1))
            
            // Два поля — часы и минуты
            Text(futureDate, format: .stopwatch(startingAt: currentDate, maxFieldCount: 2))
            
            // Три поля — часы, минуты и секунды
            Text(futureDate, format: .stopwatch(startingAt: currentDate, maxFieldCount: 3))
            
            // Без отображения часов
            Text(futureDate, format: .stopwatch(startingAt: currentDate, showsHours: false))
            
            // Без часов и только одно поле (например, “131 minutes”)
            Text(futureDate, format: .stopwatch(startingAt: currentDate,
                                                showsHours: false,
                                                maxFieldCount: 1))
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Text_StopwatchStyle()
}
