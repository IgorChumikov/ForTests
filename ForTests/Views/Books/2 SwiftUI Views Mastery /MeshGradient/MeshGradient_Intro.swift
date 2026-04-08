//
//  MeshGradient_Intro.swift
//  ForTests
//

/*
 MeshGradient — Points (iOS 18+)

 • MeshGradient строится на сетке (grid)
 • points — это координаты, где размещаются цвета
 • colors — соответствуют этим точкам (1 к 1)

 • Координаты:
   [0,0] — левый верх
   [1,1] — правый низ

 • В сетке 2x2 цвета ставятся по углам
*/

import SwiftUI

struct Mesh_Intro: View {

    // MARK: - Body
    var body: some View {
        MeshGradient(
            width: 2,
            height: 2,

            // MARK: - Points
            // Координаты точек (сеточная система)
            points: [
                [0, 0], [1, 0],
                [0, 1], [1, 1]
            ],

            // MARK: - Colors
            // Каждый цвет соответствует своей точке
            colors: [
                .red, .blue,
                .yellow, .purple
            ]
        )
        .ignoresSafeArea()
    }
}

#Preview {
    Mesh_Intro()
}
