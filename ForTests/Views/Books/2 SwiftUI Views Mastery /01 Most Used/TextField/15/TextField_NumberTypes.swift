//
//  TextField_NumberTypes.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 TextField — работа с числовыми типами (iOS 15+)

 • TextField теперь поддерживает прямую привязку к числам.
 • Благодаря инициализатору value:format: можно легко задавать формат — число, процент, валюта и т.д.
 • SwiftUI автоматически конвертирует ввод пользователя в нужный тип данных.
*/

import SwiftUI

struct TextField_NumberTypes: View {
    // MARK: - Properties
    @State private var number = 34.0

    // MARK: - Body
    var body: some View {
        VStack(spacing: 10) {
            HeaderView3(
                title: "TextField",
                subtitle: "Number Types",
                desc: "Use the value and format initializer to bind a TextField with a numeric type.",
                back: .orange,
                textColor: .white
            )

            // MARK: - Целое число
            TextField("Age", value: $number, format: .number)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding(.horizontal)

            // MARK: - Процент
            TextField("Percent", value: $number, format: .percent)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding(.horizontal)

            // MARK: - Валюта
            TextField("Amount", value: $number, format: .currency(code: "USD"))
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding(.horizontal)
        }
        .font(.title2)
        .padding()
    }
}

#Preview {
    TextField_NumberTypes()
}
