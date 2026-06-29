//
//  TextField_PersonNameComponents.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 TextField — работа с PersonNameComponents (iOS 15+)

 • TextField теперь может быть связан не только со строками, но и с типами, поддерживающими форматирование.
 • PersonNameComponents автоматически форматирует имя, фамилию и отчество по выбранному стилю.
 • Можно использовать три уровня отображения: .short, .medium, .long.
*/

import SwiftUI

struct TextField_PersonNameComponents: View {
    // MARK: - Properties
    @State private var name = PersonNameComponents(
        givenName: "Matthew",
        middleName: "Robert",
        familyName: "Moeykens"
    )

    // MARK: - Body
    var body: some View {
        VStack(spacing: 10) {
            HeaderView3(
                title: "TextField",
                subtitle: "PersonNameComponents",
                desc: "Use the value and format initializer to use a TextField with non-string types.",
                back: .orange,
                textColor: .white
            )

            // MARK: - Короткий формат
            TextField("Short Name", value: $name, format: .name(style: .short))
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            // MARK: - Средний формат
            TextField("Medium Name", value: $name, format: .name(style: .medium))
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            // MARK: - Полный формат
            TextField("Long Name", value: $name, format: .name(style: .long))
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
        }
        .font(.title2)
        .padding()
    }
}

#Preview {
    TextField_PersonNameComponents()
}
