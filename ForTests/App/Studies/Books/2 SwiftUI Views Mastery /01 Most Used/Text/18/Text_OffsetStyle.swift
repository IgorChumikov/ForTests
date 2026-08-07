//
//  Text_OffsetStyle.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 Text — вычисление разницы между датами (iOS 18+)

 • Используется новый форматер .offset(to:) для подсчёта времени между двумя датами.
 • Можно ограничивать отображаемые единицы времени через allowedFields (например, только .year).
 • maxFieldCount задаёт, сколько единиц времени показать (например, только 1 — “33 years”).
 • Поддерживает автоматическую локализацию (например, “33 года 5 месяцев” на русском).
*/

import SwiftUI

struct Text_OffsetStyle: View {
    // Устанавливаем дату рождения
    @State private var birthday: Date = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter.date(from: "1991/03/06") ?? Date()
    }()

    var body: some View {
        VStack(spacing: 24) {
            // Полный формат (годы и месяцы)
            Text(Date.now, format: .offset(to: birthday))
            
            // Только годы
            Text(Date.now, format: .offset(to: birthday, allowedFields: [.year]))
            
            // Годы и месяцы, но ограничено 1 полем
            Text(Date.now, format: .offset(to: birthday,
                                           allowedFields: [.year, .month],
                                           maxFieldCount: 1))
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Text_OffsetStyle()
}
