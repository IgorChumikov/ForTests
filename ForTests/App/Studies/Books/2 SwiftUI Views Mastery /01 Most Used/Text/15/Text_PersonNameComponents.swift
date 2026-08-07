//
//  Text_PersonNameComponents.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 Text — форматирование имени (iOS 15+)

 • Используем PersonNameComponents для хранения частей имени.
 • Модификатор .name(style:) управляет степенью детализации отображения.
*/

import SwiftUI

struct Text_PersonNameComponents: View {

    @State private var name = PersonNameComponents(
        namePrefix: "Dr.",          // титул
        givenName: "Jaqueline",     // имя
        middleName: "Fernanda",     // отчество / второе имя
        familyName: "Cruz",         // фамилия
        nameSuffix: "EdD",          // степень / суффикс
        nickname: "Jaque"           // никнейм
    )

    var body: some View {
        VStack(spacing: 20) {
            HeaderView3(
                title: "Text",
                subtitle: "PersonNameComponents",
                desc: "If the type is a name, you can format it to show the name in different ways.",
                back: .green,
                textColor: .white
            )

            // Разные стили форматирования имени
            Text(name, format: .name(style: .abbreviated))  // JC
            Text(name, format: .name(style: .short))        // Jaque
            Text(name, format: .name(style: .medium))       // Jaqueline Cruz
            Text(name, format: .name(style: .long))         // Dr. Jaqueline Fernanda Cruz EdD
                .lineLimit(1)
                .minimumScaleFactor(0.9)
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Text_PersonNameComponents()
}
