//
//  Text_DateFormatting.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 Text — форматирование дат (iOS 15+)

 • Модификатор .formatted() позволяет отображать дату или время в разных стилях.
 • Больше не нужно использовать DateFormatter.
*/

import SwiftUI

struct Text_DateFormatting: View {
    var body: some View {
        VStack(spacing: 10) {
            HeaderView3(
                title: "Text",
                subtitle: "Date Formatting",
                desc: "Use the formatted modifier on dates to format them the way you want.",
                back: .green,
                textColor: .white
            )

            // Текущая дата в формате по умолчанию
            Text(Date().formatted())

            // --- Форматы даты ---
            DescView2(desc: "Date", back: .green, textColor: .white)

            Group {
                Text(Date().formatted(date: .abbreviated, time: .omitted))
                Text(Date().formatted(date: .complete, time: .omitted))
                Text(Date().formatted(date: .omitted, time: .omitted))
                Text(Date().formatted(date: .long, time: .omitted))
                Text(Date().formatted(date: .numeric, time: .omitted))
            }

            // --- Форматы времени ---
            DescView2(desc: "Time", back: .green, textColor: .white)

            Group {
                Text(Date().formatted(date: .omitted, time: .complete))
                Text(Date().formatted(date: .omitted, time: .shortened))
                Text(Date().formatted(date: .omitted, time: .standard))
            }
            .font(.title2)
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Text_DateFormatting()
}
