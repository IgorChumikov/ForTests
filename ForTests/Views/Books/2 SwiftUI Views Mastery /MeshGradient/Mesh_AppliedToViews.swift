//
//  Mesh_AppliedToViews.swift
//  ForTests
//

/*
 MeshGradient — Applied to Views (iOS 18+)

 • Можно использовать везде, где принимается ShapeStyle
 • Например:
   - foregroundStyle
   - background
   - fill / stroke

 • Работает с Text, Image и Shape
*/

import SwiftUI

struct Mesh_AppliedToViews: View {

    // MARK: - Properties
    let gradient = MeshGradient(
        width: 2,
        height: 2,
        points: [
            [0, 0], [1, 0],
            [0, 1], [1, 1]
        ],
        colors: [
            .red, .blue,
            .yellow, .purple
        ]
    )

    // MARK: - Body
    var body: some View {
        VStack(spacing: 40) {

            // MARK: - Text with Gradient
            Text("Hello, World!")
                .foregroundStyle(gradient)

            // MARK: - SF Symbol with Gradient
            Image(systemName: "list.bullet.clipboard.fill")
                .font(.system(size: 120))
                .foregroundStyle(gradient)

            // MARK: - Text with Gradient Background
            Text("Shapes")
                .foregroundStyle(.regularMaterial)
                .padding(40)
                .background(
                    gradient,
                    in: .rect(cornerRadius: 16)
                )
        }
        .font(.largeTitle.weight(.heavy))
    }
}

#Preview {
    Mesh_AppliedToViews()
}
