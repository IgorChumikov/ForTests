//
//  Text_TimerStyle.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 Text — таймер обратного и прямого отсчёта (iOS 18+)

 • Новый форматер .timer(countingUpIn:) и .timer(countingDownIn:) позволяет показывать живой таймер.
 • Счёт может идти как вверх (counting up), так и вниз (counting down).
 • Поддерживает форматирование с часами, минутами и секундами.
 • Можно ограничить количество отображаемых полей с помощью maxFieldCount.
 • Удобно для отображения таймеров, отсчёта времени или прогресса.
*/

import SwiftUI

struct Text_TimerStyle: View {
    // MARK: - Properties
    @State private var tenSeconds = Date().addingTimeInterval(10)        // +10 секунд
    @State private var currentDate = Date()                              // текущее время
    @State private var futureDate = Date().addingTimeInterval(131 * 60)  // +131 минута

    // MARK: - Body
    var body: some View {
        VStack(spacing: 24) {
            // Прямой отсчёт: с 0 до 10 секунд
            Text(currentDate, format: .timer(countingUpIn: currentDate..<tenSeconds))
            
            // Обратный отсчёт: с 10 до 0 секунд
            Text(currentDate, format: .timer(countingDownIn: currentDate..<tenSeconds))
            
            // Отсчёт до будущей даты (показывает часы, минуты и секунды)
            Text(currentDate, format: .timer(countingDownIn: currentDate..<futureDate))
            
            // Без отображения часов
            Text(currentDate, format: .timer(countingDownIn: currentDate..<futureDate, showsHours: false))
            
            // Только одно поле (например, “130 minutes”)
            Text(currentDate, format: .timer(countingDownIn: currentDate..<futureDate,
                                             showsHours: false,
                                             maxFieldCount: 1))
            
            // Два поля (например, “2 hours, 10 minutes”)
            Text(currentDate, format: .timer(countingDownIn: currentDate..<futureDate,
                                             showsHours: true,
                                             maxFieldCount: 2))
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Text_TimerStyle()
}
