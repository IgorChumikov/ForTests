//
//  Text_Formatting.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 Text — модификации форматирования (iOS 14+)

 • .bold(), .italic() — простые стили.
 • .strikethrough(_:color:) — можно включать/отключать и задавать цвет.
 • .underline(_:color:) — аналогично.
 • .foregroundStyle() — цвет текста.
*/

import SwiftUI

struct Text_Formatting: View {
    @State private var modifierActive = true

    var body: some View {
        VStack(spacing: 20) {
            Group {
                HStack {
                    Image(systemName: "b.circle.fill")
                    Text("Bold").bold()
                }

                HStack {
                    Image(systemName: "i.circle.fill")
                    Text("Italic").italic()
                }

                HStack {
                    Image(systemName: "s.circle.fill")
                    Text("Strikethrough").strikethrough()
                }

                HStack {
                    Image(systemName: "s.circle.fill")
                    Text("Green Strikethrough")
                        .strikethrough(modifierActive, color: .green)
                }

                HStack {
                    Image(systemName: "paintpalette.fill")
                    Text("Text Color (ForegroundStyle)")
                        .foregroundStyle(.green)
                }

                HStack {
                    Image(systemName: "u.circle.fill")
                    Text("Underline").underline()
                }

                HStack {
                    Image(systemName: "u.circle.fill")
                    Text("Green Underline")
                        .underline(modifierActive, color: .green)
                }
            }

            Toggle("Modifiers Active", isOn: $modifierActive)
                .padding(.top, 30)
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    Text_Formatting()
}
