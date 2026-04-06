//
//  Path_Curve.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.04.2026.
//

/*
 Path — Curve

 • addCurve рисует кривую (Bezier)
 • to — конечная точка
 • control1 / control2 — управляют формой
 • Можно делать сложные фигуры
*/

import SwiftUI

struct Path_Curve: View {

    // MARK: - Gradient
    let gradient = LinearGradient(
        colors: [.pink, .purple],
        startPoint: .topTrailing,
        endPoint: .bottomLeading
    )

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {

            HeaderView3(
                title: "Path",
                subtitle: "Curve",
                desc: "Draw curves using addCurve",
                back: .purple,
                textColor: .white
            )

            ZStack {

                // MARK: - Залитая фигура (blob)
                CurvedShape()
                    .fill(gradient) // 🔥 градиент как на скрине
                    .overlay(
                        Image(systemName: "laptopcomputer") // пример
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    )

                // MARK: - Обводка (пунктир)
                CurvedShape()
                    .stroke(
                        .blue,
                        style: StrokeStyle(
                            lineWidth: 8,
                            lineCap: .round,
                            dash: [60, 35] // 👉 пунктир
                        )
                    )
                    .rotationEffect(.degrees(10)) // 👉 наклон
            }
            .padding(40)
        }
        .font(.title)
    }
}

#Preview {
    Path_Curve()
}


struct CurvedShape: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // 👉 стартовая точка
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))

        // 👉 кривая 1
        path.addCurve(
            to: CGPoint(x: rect.maxX, y: rect.midY),
            control1: CGPoint(x: rect.maxX, y: rect.minY),
            control2: CGPoint(x: rect.maxX, y: rect.midY)
        )

        // 👉 кривая 2
        path.addCurve(
            to: CGPoint(x: rect.midX, y: rect.maxY),
            control1: CGPoint(x: rect.maxX, y: rect.maxY),
            control2: CGPoint(x: rect.midX, y: rect.maxY)
        )

        // 👉 кривая 3
        path.addCurve(
            to: CGPoint(x: rect.minX, y: rect.midY),
            control1: CGPoint(x: rect.minX, y: rect.maxY),
            control2: CGPoint(x: rect.minX, y: rect.midY)
        )

        // 👉 кривая 4 (замыкаем форму)
        path.addCurve(
            to: CGPoint(x: rect.midX, y: rect.minY),
            control1: CGPoint(x: rect.minX, y: rect.minY),
            control2: CGPoint(x: rect.midX, y: rect.minY)
        )

        return path
    }
}
