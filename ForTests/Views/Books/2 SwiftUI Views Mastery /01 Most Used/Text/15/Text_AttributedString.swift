//
//  Text_AttributedString.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 Text — использование AttributedString (iOS 15+)

 • Позволяет применять разные стили к частям текста.
 • Работает напрямую с Text(myAttributedString).
*/

import SwiftUI

struct Text_AttributedString: View {

    @State private var name = "Big Mountain Studio"

    var myAttributedString: AttributedString {
          var attributedName = AttributedString(name)

          // Определяем диапазоны слов
          if let big = attributedName.range(of: "Big") {
              attributedName[big].foregroundColor = .green
          }
          if let mountain = attributedName.range(of: "Mountain") {
              attributedName[mountain].foregroundColor = .red
          }

          return attributedName
      }

    var body: some View {
        VStack(spacing: 40) {
            HeaderView3(
                title: "Text",
                subtitle: "AttributedString",
                desc: "You can apply attributes within a string and display that string using the Text view.",
                back: .green,
                textColor: .white
            )

            // Отображаем форматированный текст
            Text(myAttributedString)
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Text_AttributedString()
}
