//
//  Rectangular_Trim.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.04.2026.
//

/*
 Trim

 • trim показывает часть Shape
 • работает от 0 до 1
 • часто используется для прогресса
*/

import SwiftUI

struct Rectangular_Trim: View {

    @State private var progress: CGFloat = 1.0

    private var percent: Int {
        Int(progress * 100)
    }

    var body: some View {
        VStack(spacing: 30) {

            Text("Rectangular Shapes")
                .font(.largeTitle)

            Text("Trim Function")
                .foregroundStyle(.gray)

            Text("Trim your shape to only show a percentage of it.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)

            // MARK: - Shape с trim
            Rectangle()
                .trim(from: 0, to: progress) // 🔥 часть фигуры
                .stroke(
                    Color.blue,
                    style: StrokeStyle(
                        lineWidth: 40,
                        lineCap: .round // 👉 скругление концов
                    )
                )
                .frame(height: 300)
                .overlay(
                    Text("\(percent)%")
                        .font(.largeTitle)
                        .foregroundStyle(.gray)
                )
                .padding(40)

            // MARK: - Слайдер
            VStack {
                Text("Progress")

                HStack {
                    Text("0%")

                    Slider(value: $progress)

                    Text("100%")
                }
            }
        }
        .font(.title)
        .background(Color.black)
    }
}

#Preview {
    Rectangular_Trim()
}
