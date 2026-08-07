//
//  TextField_FocusStateWithEnum.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 TextField — @FocusState с enum (iOS 15+)

 • Позволяет управлять фокусом нескольких полей через одно свойство @FocusState.
 • Использует enum для хранения активного поля.
 • Удобно при создании форм с последовательным вводом (Имя → Фамилия → и т.д.).
 • Фокус автоматически перемещается по логике, заданной в onSubmit или кнопке.
*/

import SwiftUI

struct TextField_FocusStateWithEnum: View {
    // MARK: - Focus Enum
    enum NameFields {
        case firstName
        case lastName
    }

    // MARK: - Properties
    @State private var firstName = ""
    @State private var lastName = ""
    @FocusState private var nameFields: NameFields?

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            HeaderView3(
                title: "TextField",
                subtitle: "@FocusState with Enum",
                desc: "Use an enum when focus can be set to multiple text fields on the screen.",
                back: .orange,
                textColor: .white
            )

            // MARK: - Имя
            TextField("First name", text: $firstName)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .focused($nameFields, equals: .firstName) // фокус для имени
                .submitLabel(.next)
                .onSubmit {
                    // Переход к следующему полю
                    nameFields = .lastName
                }

            // MARK: - Фамилия
            TextField("Last name", text: $lastName)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
                .focused($nameFields, equals: .lastName) // фокус для фамилии
                .submitLabel(.done)
                .onSubmit {
                    // Завершить ввод
                    nameFields = nil
                }

            // MARK: - Кнопка Save
            Button("Save") {
                if firstName.isEmpty {
                    nameFields = .firstName
                } else if lastName.isEmpty {
                    nameFields = .lastName
                } else {
                    print("✅ Saved: \(firstName) \(lastName)")
                    nameFields = nil
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
    TextField_FocusStateWithEnum()
}
