//
//  Rectangular_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.04.2026.
//

/*
 Rectangle & RoundedRectangle

 • Rectangle — обычный прямоугольник
 • RoundedRectangle — со скруглением
 • по умолчанию цвет = primary (чёрный/белый)
*/

import SwiftUI

struct Rectangular_Intro: View {

    var body: some View {
        VStack(spacing: 20) {

            // MARK: - Заголовок
            Text("Rectangular Shapes")
                .font(.largeTitle)

            Text("Introduction")
                .foregroundStyle(.white)

            // MARK: - Описание
            Text("There are two rectangular shapes available in SwiftUI.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundStyle(.white)

            // MARK: - Rectangle
            Text("Rectangle")
                .foregroundStyle(.white)

            Rectangle()
                .fill(.white) // 👉 цвет
                .frame(height: 120)
                .padding()

            // MARK: - RoundedRectangle
            Text("Rounded Rectangle")
                .foregroundStyle(.white)

            RoundedRectangle(cornerRadius: 20)
                .fill(.white) // 👉 цвет
                .frame(height: 120)
                .padding()

            // MARK: - Примечание
            Text("(Notice the default colors are black)")
                .foregroundStyle(.white)
                .font(.body)
                .padding()
        }
        .font(.title)
        .background(Color.black) // 👉 как на скрине
    }
}

#Preview {
    Rectangular_Intro()
}
