//
//  Path_CurvedShape.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.04.2026.
//

/*
 Shape — кастомная фигура

 • Shape использует Path внутри
 • rect — это доступная область
 • всё строится относительно rect
 • удобно для адаптивного UI
*/

import SwiftUI

struct Path_CurvedShape: Shape {

    func path(in rect: CGRect) -> Path {

        // 👉 стартовая точка
        let startPoint = CGPoint(
            x: rect.width * 0.65,
            y: 0
        )

        var path = Path()

        path.move(to: startPoint)

        // MARK: - Кривая 1
        path.addCurve(
            to: CGPoint(x: rect.width, y: rect.height / 2),
            control1: CGPoint(x: rect.width * 0.85, y: 0),
            control2: CGPoint(x: rect.width, y: rect.height * 0.1)
        )

        // MARK: - Кривая 2
        path.addCurve(
            to: CGPoint(x: rect.width / 2, y: rect.height),
            control1: CGPoint(x: rect.width, y: rect.height * 0.9),
            control2: CGPoint(x: rect.width * 0.75, y: rect.height)
        )

        // MARK: - Кривая 3
        path.addCurve(
            to: CGPoint(x: 0, y: rect.height * 0.7),
            control1: CGPoint(x: rect.width * 0.35, y: rect.height),
            control2: CGPoint(x: 0, y: rect.height)
        )

        // MARK: - Кривая 4
        path.addCurve(
            to: CGPoint(x: rect.width * 0.3, y: rect.height * 0.3),
            control1: CGPoint(x: 0, y: rect.height * 0.4),
            control2: CGPoint(x: rect.width * 0.17, y: rect.height * 0.45)
        )

        // MARK: - Закрытие формы
        path.addCurve(
            to: startPoint,
            control1: CGPoint(x: rect.width * 0.42, y: rect.height * 0.16),
            control2: CGPoint(x: rect.width * 0.46, y: 0)
        )

        return path
    }
}

struct Path_ShapeExample: View {

    let gradient = LinearGradient(
        colors: [.pink, .purple],
        startPoint: .topTrailing,
        endPoint: .bottomLeading
    )

    var body: some View {
        ZStack {

            // 👉 заливка
            CurvedShape()
                .fill(gradient)

            // 👉 обводка пунктиром
            CurvedShape()
                .stroke(
                    .blue,
                    style: StrokeStyle(
                        lineWidth: 8,
                        lineCap: .round,
                        dash: [60, 35]
                    )
                )
                .rotationEffect(.degrees(10))
        }
        .padding(40)
    }
}

#Preview {
    Path_CurvedShape()
}
