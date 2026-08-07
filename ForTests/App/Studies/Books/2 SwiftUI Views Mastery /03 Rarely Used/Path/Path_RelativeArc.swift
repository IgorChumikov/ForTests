//
//  Path_RelativeArc.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.04.2026.
//

import SwiftUI

struct Path_RelativeArc: View {

    var body: some View {
        VStack(spacing: 0) {

            // 👉 верхняя "купол" часть
            DomeShape()
                .fill(.purple)

            // 👉 низ (прямоугольник)
            Rectangle()
                .fill(.purple)
        }
        .padding(.horizontal)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    Path_RelativeArc()
}



/*
 Relative Arc

 • addRelativeArc рисует дугу
 • center — центр круга
 • radius — радиус
 • startAngle — старт
 • delta — длина дуги
*/

import SwiftUI

struct DomeShape: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.addRelativeArc(
            center: CGPoint(
                x: rect.midX,
                y: rect.maxY // 👉 центр снизу
            ),
            radius: rect.midX, // 👉 половина ширины
            startAngle: .degrees(180), // 👉 слева
            delta: .degrees(180)       // 👉 до правой стороны
        )

        return path
    }
}
