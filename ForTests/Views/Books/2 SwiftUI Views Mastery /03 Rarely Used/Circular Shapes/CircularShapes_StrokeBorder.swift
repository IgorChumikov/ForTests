//
//  CircularShapes_StrokeBorder.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Stroke vs StrokeBorder

 • .stroke() рисует линию по центру границы (часть выходит наружу).
 • .strokeBorder() рисует линию внутри фигуры.
 • strokeBorder безопаснее для UI (нет наложений).
*/

import SwiftUI

struct CircularShapes_StrokeBorder: View {

    // MARK: - Body
    var body: some View {
        VStack(spacing: 10) {
            
            Text("Circular Shapes")
                .font(.largeTitle)
            
            Text("Stroke Border (внутренняя обводка)")
                .foregroundStyle(.gray)
            
            // MARK: - Stroke
            Text("stroke выходит за границы")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundStyle(.white)
            
            ZStack {
                Capsule()
                    .stroke(Color.purple, lineWidth: 40)
                
                Capsule()
                    .stroke(Color.black) // граница
            }
            .frame(height: 100)
            .padding()
            
            // MARK: - StrokeBorder
            Text("strokeBorder рисует внутри")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundStyle(.white)
            
            ZStack {
                Capsule()
                    .strokeBorder(Color.purple, lineWidth: 40)
                
                Capsule()
                    .stroke(Color.black) // граница
            }
            .frame(height: 100)
            .padding()
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    CircularShapes_StrokeBorder()
}
