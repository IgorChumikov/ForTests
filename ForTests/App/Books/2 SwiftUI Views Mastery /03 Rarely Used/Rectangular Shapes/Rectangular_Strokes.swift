//
//  Rectangular_Strokes.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.04.2026.
//

/*
 Stroke (Outline)

 • stroke — рисует контур
 • lineWidth — толщина
 • StrokeStyle — кастомизация линии
*/

import SwiftUI

struct Rectangular_Strokes: View {

    var body: some View {
        VStack(spacing: 25) {

            Text("Rectangular Shapes")
                .font(.largeTitle)
                .foregroundStyle(.white)

            // MARK: - Простая линия
            Rectangle()
                .stroke(Color.blue)
                .frame(height: 100)
                .padding()

            // MARK: - Толстая линия
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.blue, lineWidth: 20)
                .frame(height: 100)
                .padding()

            // MARK: - Пунктир
            RoundedRectangle(cornerRadius: 25)
                .stroke(
                    Color.blue,
                    style: StrokeStyle(
                        lineWidth: 10,
                        lineCap: .round,
                        dash: [15, 25]
                    )
                )
                .frame(height: 100)
                .padding()
        }
        .background(Color.black)
    }
}

#Preview {
    Rectangular_Strokes()
}
