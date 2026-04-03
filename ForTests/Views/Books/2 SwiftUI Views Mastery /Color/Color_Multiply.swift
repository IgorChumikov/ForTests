//
//  Color_Multiply.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Color Multiply

 • .colorMultiply() смешивает цвета.
 • Можно получать новые цвета из комбинаций.
 • Работает как умножение цветов (не просто overlay).
*/

import SwiftUI

struct Color_Multiply: View {

    // MARK: - Body
    var body: some View {
        VStack(spacing: 30) {
            
            HeaderView3(
                title: "Color",
                subtitle: "Color Multiply",
                desc: "Можно смешивать цвета и получать новые.",
                back: .black,
                textColor: .white
            )
            
            // MARK: - Пример 1
            HStack {
                Color.pink.frame(width: 80, height: 80)
                Text("+")
                Color.blue.frame(width: 80, height: 80)
                Text("=")
                Color.pink
                    .colorMultiply(.blue)
                    .frame(width: 80, height: 80)
            }
            
            // MARK: - Пример 2
            HStack {
                Color.yellow.frame(width: 80, height: 80)
                Text("+")
                Color.blue.frame(width: 80, height: 80)
                Text("=")
                Color.yellow
                    .colorMultiply(.blue)
                    .frame(width: 80, height: 80)
            }
            
            // MARK: - Пример 3
            HStack {
                Color.yellow.frame(width: 80, height: 80)
                Text("+")
                Color.red.frame(width: 80, height: 80)
                Text("=")
                Color.yellow
                    .colorMultiply(.red)
                    .frame(width: 80, height: 80)
            }
        }
        .font(.title3)
    }
}

#Preview {
    Color_Multiply()
}
