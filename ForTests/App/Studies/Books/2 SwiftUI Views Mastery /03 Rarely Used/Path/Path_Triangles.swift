//
//  Path_Triangles.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.04.2026.
//

/*
 Path — Triangles

 • Рисуем треугольник через Path
 • GeometryReader даёт размеры
 • closeSubpath() замыкает фигуру
 • .stroke → контур
 • .fill → заливка
*/

import SwiftUI

struct Path_Triangles: View {

    // MARK: - Body
    var body: some View {
        VStack(spacing: 40) {

            HeaderView3(
                title: "Path",
                subtitle: "Triangles",
                desc: "Draw triangles using Path",
                back: .purple,
                textColor: .white
            )

            // MARK: - Контур треугольника
            GeometryReader { geo in
                Path { path in

                    let middle = geo.size.width / 2 // 👉 центр
                    let width: CGFloat = 200        // 👉 ширина

                    // 👉 верхняя точка
                    path.move(to: CGPoint(x: middle, y: 10))

                    // 👉 правая нижняя
                    path.addLine(to: CGPoint(
                        x: middle + width / 2,
                        y: 170
                    ))

                    // 👉 левая нижняя
                    path.addLine(to: CGPoint(
                        x: middle - width / 2,
                        y: 170
                    ))

                    path.closeSubpath() // 🔥 замыкает треугольник
                }
                .stroke(.purple, lineWidth: 4) // контур
            }
            .frame(height: 200)

            // MARK: - Закрашенный треугольник
            GeometryReader { geo in
                Path { path in

                    let middle = geo.size.width / 2
                    let width: CGFloat = 200

                    path.move(to: CGPoint(x: middle, y: 10))

                    path.addLine(to: CGPoint(
                        x: middle + width / 2,
                        y: 170
                    ))

                    path.addLine(to: CGPoint(
                        x: middle - width / 2,
                        y: 170
                    ))

                    path.closeSubpath()
                }
                .fill(.purple) // 🔥 заливка
                .rotationEffect(.degrees(90)) // 👉 поворот как на скрине
            }
            .frame(height: 200)
        }
        .padding()
    }
}

#Preview {
    Path_Triangles()
}
