//
//  TextField_FocusState.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 TextField — управление фокусом через @FocusState (iOS 15+)

 • @FocusState позволяет отслеживать и программно управлять фокусом поля ввода.
 • Можно ставить фокус при открытии экрана, после действий пользователя или при ошибке валидации.
 • Удобно для форм, логинов, последовательного перехода между полями.
*/

import SwiftUI

struct TextField_FocusState: View {
    // MARK: - Properties
    @State private var name = ""
    @FocusState private var nameIsFocused: Bool

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            HeaderView3(
                title: "TextField",
                subtitle: "@FocusState",
                desc: "Use @FocusState to set focus to a TextField.",
                back: .orange,
                textColor: .white
            )

            // MARK: - Поле ввода
            TextField("Enter name to continue", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding()
                .focused($nameIsFocused) // Привязка состояния фокуса
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.red, lineWidth: nameIsFocused ? 2 : 0)
                )
                .padding()

            // MARK: - Кнопка Continue
            Button("Continue") {
                if name.isEmpty {
                    // Если поле пустое — ставим фокус обратно
                    nameIsFocused = true
                } else {
                    print("✅ Continue with name: \(name)")
                    nameIsFocused = false
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
        }
        .font(.title2)
        .padding()
    }
}

#Preview {
    TextField_FocusState()
}
