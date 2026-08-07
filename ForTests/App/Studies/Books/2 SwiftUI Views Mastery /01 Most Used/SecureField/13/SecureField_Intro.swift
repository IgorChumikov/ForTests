//
//  SecureField_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.11.2025.
//

/*
 SecureField — ввод пароля с защитой (iOS 13+)

 • Используется для скрытого ввода текста (например, пароля).
 • Требует привязку к @State-переменной для хранения значения.
 • Работает аналогично TextField, но отображает точки вместо символов.
 • Оформление задаётся модификатором .textFieldStyle().
*/

import SwiftUI

struct SecureField_Intro: View {
    @State private var userName = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Image("Logo")

            Spacer()

            Text("SecureField")
                .font(.largeTitle)

            Text("Introduction")
                .font(.title)
                .foregroundStyle(.gray)

            Text("SecureFields, like TextFields, need to bind to a local variable.")

            TextField("user name", text: $userName)
                .textFieldStyle(.roundedBorder) // iOS 15+
                .padding()

            SecureField("password", text: $password)
                .textFieldStyle(.roundedBorder) // iOS 15+
                .padding()

            Spacer()
        }
        .padding()
    }
}

#Preview {
    SecureField_Intro()
}
