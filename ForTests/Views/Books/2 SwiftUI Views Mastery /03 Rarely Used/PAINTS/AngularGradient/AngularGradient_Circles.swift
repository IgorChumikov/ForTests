//
//  AngularGradient_Circles.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 AngularGradient + Shapes

 • Можно заливать фигуры через .fill()
 • Можно применять к обводке через .stroke()
 • Работает с Circle, Ellipse, Capsule и любыми Shape
 • Отлично подходит для progress / кольца
*/

import SwiftUI

struct AngularGradient_Circles: View {

    // MARK: - Body
    var body: some View {

        let gradient = Gradient(colors: [.pink, .purple, .pink])

        let angularGradient = AngularGradient(
            gradient: gradient,
            center: .center,
            angle: .degrees(0)
        )

        return VStack(spacing: 20) {

            // MARK: - Header
            Text("Angular Gradient")
                .font(.largeTitle)

            Text("With Circles")
                .font(.title)
                .foregroundStyle(.gray)

            Text("You can fill circular shapes with gradients")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundStyle(.white)

            // MARK: - Fill
            HStack {
                Circle()
                    .fill(angularGradient)

                Ellipse()
                    .fill(angularGradient)

                Capsule()
                    .fill(angularGradient)
            }
            .frame(height: 120)
            .padding(.horizontal)

            Text("You can also apply gradients to strokes")

            // MARK: - Stroke
            HStack {

                Circle()
                    .stroke(angularGradient, lineWidth: 10)

                Ellipse()
                    .strokeBorder(angularGradient, lineWidth: 10)

                Capsule()
                    .trim(from: 0.25, to: 1)
                    .stroke(
                        angularGradient,
                        style: StrokeStyle(
                            lineWidth: 10,
                            lineCap: .round
                        )
                    )
            }
            .frame(height: 120)
            .padding(.horizontal)
        }
        .padding()
        .font(.title)
    }
}

#Preview {
    AngularGradient_Circles()
}
