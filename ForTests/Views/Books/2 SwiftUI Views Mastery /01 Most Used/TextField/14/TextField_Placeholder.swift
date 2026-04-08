//
//  TextField_Placeholder.swift
//  ForTests
//
//  Created by Игорь Чумиков on 14.11.2025.
//

/*
 TextField — текст-подсказка (placeholder / hint text) (iOS 14+)

 • Placeholder задаётся первым параметром при создании TextField.
 • Он отображается, когда поле пустое, и исчезает при вводе текста.
 • Можно использовать несколько TextField с разными подсказками (например, логин и пароль).
 • Для визуального оформления добавьте .textFieldStyle(.roundedBorder).
*/

import SwiftUI

struct TextField_Placeholder: View {
    // MARK: - Properties
    @State private var textFieldData = ""
    @State private var username = ""
    @State private var password = ""

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            Text("TextField")
                .font(.largeTitle)

            Text("Title Text (Placeholder or Hint)")
                .foregroundStyle(.gray)

            Text("You can supply title text (placeholder/hint text) through the first parameter to let the user know the purpose of the text field.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundStyle(.white)

            Group {
                // Пример поля с подсказкой
                TextField("Here is title text", text: $textFieldData)
                    .textFieldStyle(.roundedBorder)

                // Поле для ввода имени пользователя
                TextField("User name", text: $username)
                    .textFieldStyle(.roundedBorder)

                // Поле для ввода пароля
                TextField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal)
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    TextField_Placeholder()
}
