//
//  Path_QuadCurve.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.04.2026.
//


/*
 QuadCurve

 • addQuadCurve — простая кривая
 • control — управляет изгибом
 • отлично подходит для UI (карточки, header)
*/

import SwiftUI

struct Path_QuadCurve: View {

    var body: some View {
        VStack(spacing: 20) {

            // MARK: - Верхний блок
            RoundedBottomRectangle(curveOffset: 30)
                .fill(.purple)
                .frame(height: 120)
                .shadow(radius: 8)
                .overlay(
                    Text("Path")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding(.top, 40)
                )

            Text("QuadCurve")
                .foregroundStyle(.gray)

            // MARK: - Текст с фоном
            Text("Here's an example of how you add a curve to your path.")
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .padding()
                .background(
                    RoundedBottomRectangle(curveOffset: -30) // 🔥 изгиб вверх
                        .fill(.purple)
                        .shadow(radius: 4, y: 4)
                )

            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    Path_QuadCurve()
}


//
//  RoundedBottomRectangle.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.04.2026.
//

/*
 QuadCurve

 • addQuadCurve — простая кривая
 • control — управляет изгибом
 • отлично подходит для UI (карточки, header)
*/

import SwiftUI

struct RoundedBottomRectangle: Shape {

    var curveOffset: CGFloat = 30 // 👉 сила изгиба

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // 👉 верх
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))

        // 👉 правый край
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))

        // 🔥 нижняя кривая
        path.addQuadCurve(
            to: CGPoint(x: 0, y: rect.height), // конец
            control: CGPoint(
                x: rect.width / 2,
                y: rect.height + curveOffset // 👉 изгиб вниз
            )
        )

        // 👉 закрываем фигуру
        path.closeSubpath()

        return path
    }
}
