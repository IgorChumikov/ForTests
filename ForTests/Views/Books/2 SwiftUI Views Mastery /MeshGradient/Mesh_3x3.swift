//
//  Mesh_3x3.swift
//  ForTests
//

/*
 MeshGradient — 3x3 Grid (iOS 18+)

 • width / height — размер сетки
 • points — координаты точек (от 0 до 1)
 • colors — цвета, соответствующие каждой точке

 • Важно:
   количество colors = количеству points

 • 3x3 = 9 точек → 9 цветов
*/

import SwiftUI

struct Mesh_3x3: View {

    // MARK: - Body
    var body: some View {
        MeshGradient(
            width: 3,
            height: 3,

            // MARK: - Points
            points: [
                [0, 0],   [0.5, 0],   [1, 0],
                [0, 0.5], [0.5, 0.5], [1, 0.5],
                [0, 1],   [0.5, 1],   [1, 1]
            ],

            // MARK: - Colors
            colors: [
                .red, .blue, .green,
                .yellow, .clear, .brown,
                .pink, .purple, .black
            ]
        )
        .ignoresSafeArea()
    }
}

#Preview {
    Mesh_3x3()
}
