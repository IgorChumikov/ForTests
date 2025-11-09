//
//  Text_CombiningModifiedText.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 Text — объединение форматированного текста (iOS 13+)

 • Можно комбинировать несколько Text-вью через оператор "+"
 • Каждый Text может иметь собственные модификаторы (цвет, шрифт, стиль)
 • Полезно для создания сложных надписей с выделениями
*/

import SwiftUI

struct Text_CombiningModifiedText: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Text")
                .font(.largeTitle)
            Text("Combining Text Views")
                .font(.title)
                .foregroundStyle(.gray)
            HStack {
                Image(systemName: "textformat")
                Image(systemName: "text.badge.plus")
            }

            // Пример 1
            Group {
                Text("You can ")
                + Text("format").bold()
                + Text(" different parts of your text by using the plus (+) symbol.")
            }
            .font(.title3)
            .padding()
            .background(Color.green)
            .foregroundStyle(.white)

            // Пример 2
            Group {
                Text("Here is another ")
                + Text("example").foregroundStyle(.red).underline()
                + Text(" of how you might accomplish this. ")
                + Text("Notice").foregroundStyle(.purple).bold()
                + Text(" the use of the Group view to add padding and line limit to all the text ")
                + Text("as a whole.").bold().italic()
            }
            .font(.title3)
            .padding(.horizontal)

            // Пример 3
            Group {
                Text("You can also ")
                    .font(.title)
                    .fontWeight(.light)
                + Text("combine")
                + Text(" different font weights ")
                    .fontWeight(.black)
                + Text("and different text styles")
                    .font(.title)
                    .fontWeight(.ultraLight)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    Text_CombiningModifiedText()
}
