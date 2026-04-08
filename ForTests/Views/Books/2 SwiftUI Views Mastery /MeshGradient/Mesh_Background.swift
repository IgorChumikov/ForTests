//
//  MeshGradient_Background.swift
//  ForTests
//

/*
 MeshGradient — Background (iOS 18+)

 • background — задаёт цвет фона
 • Используется, если точки (points) не покрывают всю область

 • Если между цветами есть “пустоты” — будет виден background
*/

import SwiftUI

struct Mesh_Background: View {

    // MARK: - Body
    var body: some View {
        MeshGradient(
            width: 2,
            height: 2,

            // MARK: - Points
            points: [
                [0, 0], [0.5, 0],
                [0, 1], [1, 1]
            ],

            // MARK: - Colors
            colors: [
                .red, .blue,
                .yellow, .purple
            ],

            // MARK: - Background
            background: .blue
        )
        .ignoresSafeArea()
    }
}

#Preview {
    Mesh_Background()
}
