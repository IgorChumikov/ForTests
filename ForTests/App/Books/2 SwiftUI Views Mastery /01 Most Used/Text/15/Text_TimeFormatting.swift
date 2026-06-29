//
//  Text_TimeFormatting.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 Text — выборочное форматирование времени (iOS 15+)

 • Используем .formatted(.dateTime.<component>()) для вывода отдельных частей времени.
 • Можно комбинировать: час, минуты, секунды, часовой пояс.
*/

import SwiftUI

struct Text_TimeFormatting: View {
    var body: some View {
        VStack(spacing: 10) {
            HeaderView3(
                title: "Text",
                subtitle: "Time Format – Specific Parts",
                desc: "Use the formatted modifier on dates to show just specific parts of a time.",
                back: .green,
                textColor: .white
            )

            // Текущая дата и время в стандартном формате
            Text(Date().formatted())

            // --- Отдельные части времени ---
            DescView2(desc: "Parts", back: .green, textColor: .red)

            Group {
                Text("Hour: \(Date().formatted(.dateTime.hour()))")
                Text("Minutes: \(Date().formatted(.dateTime.minute()))")
                Text("Seconds: \(Date().formatted(.dateTime.second()))")
                Text("Timezone: \(Date().formatted(.dateTime.timeZone()))")
            }

            // --- Другие варианты форматирования ---
            DescView2(desc: "Other Formats", back: .green, textColor: .red)

            Group {
                // Без AM/PM
                Text(Date().formatted(.dateTime.minute().hour(.twoDigits(amPM: .omitted))))

                // С узким обозначением AM/PM ("a" → "p")
                Text(Date().formatted(.dateTime.hour(.twoDigits(amPM: .narrow))))

                // Полный формат даты и времени
                Text(Date().formatted(.dateTime))
            }
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Text_TimeFormatting()
}
