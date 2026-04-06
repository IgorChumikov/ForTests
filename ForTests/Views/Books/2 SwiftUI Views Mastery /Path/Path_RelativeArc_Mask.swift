//
//  Path_RelativeArc_Mask.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.04.2026.
//

import SwiftUI

struct Path_RelativeArc_Mask: View {

    let gradient = AngularGradient(
        colors: [.red, .orange, .yellow, .blue, .green],
        center: .bottom,
        startAngle: .degrees(-180),
        endAngle: .degrees(0)
    )

    var body: some View {
        VStack(spacing: 20) {

            HeaderView3(
                title: "Path",
                subtitle: "Mask",
                desc: "Combine shapes with mask",
                back: .purple,
                textColor: .white
            )

            HalfCircleProgress(progress: 0.75)
                .fill(gradient) // 👉 цвет
                .frame(height: 200)
                .background(Color(.systemGray5))
                .mask(
                    Image("meter222") // 🔥 форма (как трафарет)
                        .resizable()
                        .scaledToFit()
                )
        }
    }
}

#Preview {
    Path_RelativeArc_Mask()
}


struct HalfCircleProgress: Shape {

    var progress: CGFloat = 0.7 // 👉 от 0 до 1

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.addRelativeArc(
            center: CGPoint(x: rect.midX, y: rect.maxY),
            radius: rect.midX,
            startAngle: .degrees(180),
            delta: .degrees(180 * progress) // 🔥 зависит от progress
        )

        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.closeSubpath()

        return path
    }
}
