//
//  TopBarWithCutout.swift
//  ForTests
//
//  Created by Игорь Чумиков on 15.10.2025.
//

import SwiftUI

struct TopBarWithCutout: View {
    var body: some View {
        VStack(spacing: 0) {
            CutoutLineShape(
                midpoint: UIScreen.main.bounds.width / 2,
                circleRadius: 22.5 // радиус из фигмы (45 px)
            )
            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            .frame(width: UIScreen.main.bounds.width, height: 45) // высота как в фигме
        }
    }
}

struct CutoutLineShape: Shape {
    var midpoint: CGFloat
    var circleRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width
            let centerX = midpoint
            let r = circleRadius
            
            // Линия слева до начала выреза
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: centerX - r, y: 0))
            
            // Дуга вверх (∩)
            path.addArc(center: CGPoint(x: centerX, y: 0),
                        radius: r,
                        startAngle: .degrees(180),
                        endAngle: .degrees(0),
                        clockwise: true)
            
            // Линия после дуги до конца
            path.addLine(to: CGPoint(x: width, y: 0))
        }
    }
}

#Preview {
    TopBarWithCutout()
}
