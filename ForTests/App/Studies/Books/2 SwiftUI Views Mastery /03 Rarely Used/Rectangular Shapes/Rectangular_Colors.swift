//
//  Rectangular_Colors.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.04.2026.
//

/*
 Colors in Shapes

 • .fill() — основной способ
 • .foregroundStyle() — современный способ
 • .background() — фон
*/

import SwiftUI

struct Rectangular_Colors: View {

    var body: some View {
        VStack(spacing: 10) {

            // MARK: - Заголовок
            Text("Rectangular Shapes")
                .font(.largeTitle)
                .foregroundStyle(.white)

            Text("Colors")
                .foregroundStyle(.gray)

            // MARK: - Описание
            Text("Rectangular shapes can have shape styles applied to them.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundStyle(.white)

            // MARK: - fill
            Text("Using .fill(Color.pink)")
                .foregroundStyle(.white)

            RoundedRectangle(cornerRadius: 20)
                .fill(Color.pink) // 🔥 красим сам shape
                .frame(height: 80)
                .padding()

            // MARK: - foregroundStyle
            Text("Using .foregroundStyle(Color.green)")
                .foregroundStyle(.white)

            Rectangle()
                .foregroundStyle(Color.green) // 🔥 тоже красит shape
                .frame(height: 80)
                .padding()

            // MARK: - background
            Text("Using .background(Color.blue)")
                .foregroundStyle(.white)

            RoundedRectangle(cornerRadius: 40)
                .fill(.white) // сама фигура белая
                .frame(height: 80)
                .background(Color.blue) // 🔥 фон сзади
                .padding()
        }
        .font(.title)
        .background(Color.black)
    }
}

#Preview {
    Rectangular_Colors()
}
