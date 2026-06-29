//
//  Text_Inflection.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 Text — автоматическое склонение слов (iOS 15+)

 • Используется модификатор inflect: true для автоматического изменения формы.
 • Работает только с AttributedString.
 • Формат: ^[*строка*]/(inflect: true)
*/

import SwiftUI

struct Text_Inflection: View {

    @State private var count = 1

    var body: some View {
        Form {
            Stepper("Count", value: $count, step: 1)
                .bold()

            Text("^\(count) Year(s)/(inflect: true)")
            Text("^\(count) Child/(inflect: true)")
            Text("^\(count) Man/(inflect: true)")
            Text("^\(count) Woman/(inflect: true)")
            Text("^\(count) Person/(inflect: true)")
            Text("^\(count) Moose/(inflect: true)") // слово не изменяется во множественном числе
        }
        .font(.title)
    }
}

#Preview {
    Text_Inflection()
}
