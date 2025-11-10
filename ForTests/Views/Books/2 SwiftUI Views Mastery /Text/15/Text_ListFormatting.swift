//
//  Text_ListFormatting.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 Text — форматирование списка (iOS 15+)

 • Форматирует массив строк или PersonNameComponents в читаемый список.
 • Можно указать тип объединения (.and / .or) и ширину (.narrow / .short / .standard).
 • Параметр memberStyle позволяет форматировать каждый элемент массива.
*/

import SwiftUI

struct Text_ListFormatting: View {

    @State private var people = ["Mark", "Chase", "Rod", "Chris"]

    @State private var names = [
        PersonNameComponents(givenName: "Mark", familyName: "Smith"),
        PersonNameComponents(givenName: "Chase", familyName: "Blue"),
        PersonNameComponents(givenName: "Rod", familyName: "Liber"),
        PersonNameComponents(givenName: "Chris", familyName: "Durts")
    ]

    var body: some View {
        VStack(spacing: 20) {
            HeaderView3(
                title: "Text",
                subtitle: "List Formatting",
                desc: "You can format an array of values so they are all comma separated and join the last element as specified.",
                back: .green,
                textColor: .white
            )

            // Примеры форматирования массива строк
            Text(people, format: .list(type: .and))       // Mark, Chase, Rod, and Chris
            Text(people, format: .list(type: .or))        // Mark, Chase, Rod, or Chris

            Text(people, format: .list(type: .and, width: .narrow))   // Mark, Chase, Rod & Chris
            Text(people, format: .list(type: .and, width: .short))    // Mark, Chase, Rod, & Chris
            Text(people, format: .list(type: .and, width: .standard)) // Mark, Chase, Rod, and Chris

            // Форматирование списка имен с членским стилем
            Text(names, format: .list(
                memberStyle: .name(style: .abbreviated),
                type: .and,
                width: .short
            ))
            // Вывод: MS, CB, RL, & CD
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Text_ListFormatting()
}
