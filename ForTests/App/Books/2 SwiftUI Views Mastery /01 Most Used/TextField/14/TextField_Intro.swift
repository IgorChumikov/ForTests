//
//  TextField_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 14.11.2025.
//

/*
 TextField — ввод текста (iOS 14+)

 • Для работы TextField требуется привязка к переменной @State, чтобы получать и изменять значение.
 • По умолчанию TextField имеет стиль .plain, без визуального оформления.
 • Чтобы добавить рамку, используйте .textFieldStyle(.roundedBorder) (iOS 15+).
 • В iOS 14 используйте RoundedBorderTextFieldStyle().
*/

import SwiftUI

struct TextField_Intro: View {
    // MARK: - Properties
    @State private var textFieldData = ""

    // MARK: - Body
    var body: some View {
        VStack(spacing: 10) {
            HeaderView3(
                title: "TextField",
                subtitle: "Introduction",
                desc: """
                It is required to bind text fields to a variable when using them \
                so you can get/set the text. By default, TextFields have a plain \
                TextFieldStyle that has no visual content to be seen.
                """,
                back: .orange,
                textColor: .white
            )

            Image(systemName: "arrow.down.circle")

            // Простой TextField без стиля
            TextField("This is a text field", text: $textFieldData)
                .padding(.horizontal)

            Image(systemName: "arrow.up.circle")

            // Текст с подсказкой для пользователя
            Text("Use .textFieldStyle(.roundedBorder) to show a border.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange.opacity(0.9))
                .cornerRadius(8)
                .foregroundColor(.white)

            // TextField с рамкой
            TextField("", text: $textFieldData)
                .textFieldStyle(.roundedBorder) // iOS 15+
                .padding(.horizontal)
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    TextField_Intro()
}
