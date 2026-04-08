//
//  Text_DateFormat_Specific.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 Text — выборочные части даты (iOS 15+)

 • Используем .formatted(.dateTime.<component>()) для извлечения конкретных частей даты.
 • Можно комбинировать разные компоненты (порядок не важен).
*/

import SwiftUI

struct Text_DateFormat_Specific: View {
    var body: some View {
        VStack(spacing: 10) {
            HeaderView3(
                title: "Text",
                subtitle: "Date Format – Specific Parts",
                desc: "Use the formatted modifier on dates to show just specific parts of a date time.",
                back: .green,
                textColor: .white
            )

            // Текущая дата в формате по умолчанию
            Text(Date().formatted())

            // --- Отдельные части даты ---
            DescView2(desc: "Parts", back: .green, textColor: .red)

            Group {
                Text("Week of Year: \(Date().formatted(.dateTime.week()))")
                Text("Week of Month: \(Date().formatted(.dateTime.week(.weekOfMonth)))")
                Text("Weekday: \(Date().formatted(.dateTime.weekday()))")
                Text("Weekday (wide): \(Date().formatted(.dateTime.weekday(.wide)))")
                Text("Day #: \(Date().formatted(.dateTime.day(.ordinalOfDayInMonth)))")
            }

            // --- Комбинация разных частей ---
            DescView2(desc: "Ordering Doesn't Matter", back: .green, textColor: .red)

            Group {
                Text(Date().formatted(.dateTime.day().month(.wide).year()))
                // Результат: July 25, 2021
            }
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Text_DateFormat_Specific()
}
