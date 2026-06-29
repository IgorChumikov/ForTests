//
//  TextField_OnSubmit.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 TextField — обработка нажатия Return (onSubmit) (iOS 15+)

 • Модификатор .onSubmit позволяет выполнить действие при нажатии клавиши Return.
 • С помощью .submitLabel(_:) можно задать текст кнопки Return на клавиатуре (join, done, search и др.).
 • Это удобно при вводе данных, добавлении элементов в список или переходе между полями.
*/

import SwiftUI

struct TextField_OnSubmit: View {
    // MARK: - Properties
    @State private var name = ""
    @State private var names = ["Donny", "Sean", "Paul"]

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            HeaderView3(
                title: "TextField",
                subtitle: "onSubmit",
                desc: "You can determine what happens when the keyboard's Return button is tapped.",
                back: .orange,
                textColor: .white
            )

            // MARK: - Поле ввода
            TextField("Join the group!", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding()
                .submitLabel(.join) // Меняем надпись на кнопке клавиатуры
                .onSubmit {
                    // Добавляем имя в список при нажатии Return
                    guard !name.isEmpty else { return }
                    names.append(name)
                    name = ""
                }

            // MARK: - Список добавленных имён
            List(names, id: \.self) { name in
                Text(name)
                    .padding(.vertical, 4)
            }
        }
        .font(.title2)
        .padding()
    }
}

#Preview {
    TextField_OnSubmit()
}
