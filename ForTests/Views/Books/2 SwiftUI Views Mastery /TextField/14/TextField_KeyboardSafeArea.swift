//
//  TextField_KeyboardSafeArea.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 TextField — безопасная область клавиатуры (Keyboard Safe Area) (iOS 14+)

 • SwiftUI автоматически поднимает TextField и SecureField, когда появляется клавиатура.
 • Это гарантирует, что элементы не перекрываются и остаются видимыми.
 • Работает “из коробки”, без ручных вычислений смещения.
 • Особенно полезно при работе с формами и экранами авторизации.
*/

import SwiftUI

struct TextField_KeyboardSafeArea: View {
    // MARK: - Properties
    @State private var userName = ""
    @State private var password = ""

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            // Логотип
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)

            Spacer()

            // Заголовок и описание
            HeaderView3(
                title: "TextField",
                subtitle: "Keyboard Safe Area",
                desc: "TextFields will automatically move into view when the keyboard appears. The keyboard adjusts the safe area so it will not cover views.",
                back: .orange,
                textColor: .white
            )

            // MARK: - Поле логина
            TextField("user name", text: $userName)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            // MARK: - Поле пароля
            SecureField("password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    TextField_KeyboardSafeArea()
}
