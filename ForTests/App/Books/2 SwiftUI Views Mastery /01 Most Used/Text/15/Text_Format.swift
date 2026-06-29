//
//  Text_Format.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 Text — форматирование числовых значений (iOS 15+)

 • Новый инициализатор позволяет передавать нестроковые типы данных.
 • Форматирование управляется с помощью FormatStyle (например, .number, .percent, .currency).
*/

import SwiftUI

struct Text_Format: View {
    @State private var value = 12.34

    var body: some View {
        VStack(spacing: 20) {
            HeaderView3(
                title: "Text",
                subtitle: "Format",
                desc: "There is an initializer for the Text view that allows you to convert a nonstring type to a string with a specific format.",
                back: .green,
                textColor: .white
            )

            // Число
            Text(value, format: .number)

            // Процент
            Text(value, format: .percent)

            // Валюта (в фунтах стерлингов)
            Text(value, format: .currency(code: "GBP"))
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Text_Format()
}
