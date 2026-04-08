//
//  CircularShapes_Stroke.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Stroke — обводка фигур

 • .stroke() рисует только границу фигуры.
 • Можно задавать цвет и толщину линии.
 • Через StrokeStyle можно сделать пунктир.
*/

import SwiftUI

struct CircularShapes_Stroke: View {

    // MARK: - Body
    var body: some View {
        VStack(spacing: 10) {
            
            Text("Circular Shapes")
                .font(.largeTitle)
            
            Text("Обводка (Stroke)")
                .foregroundStyle(.gray)
            
            // MARK: - Описание
            Text("Stroke рисует только границу фигуры.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundStyle(.white)
            
            // MARK: - Простая обводка
            Text("Используем .stroke(Color.purple)")
            
            Circle()
                .stroke(Color.purple)
                .frame(height: 100)
                .padding()
            
            // MARK: - Толщина линии
            Text("Толщина линии = 20")
            
            Capsule()
                .stroke(Color.purple, lineWidth: 20)
                .frame(height: 80)
                .padding()
            
            // MARK: - Пунктир
            Text("Пунктирная линия")
            
            Ellipse()
                .stroke(
                    Color.purple,
                    style: StrokeStyle(
                        lineWidth: 10,
                        dash: [15, 10]
                    )
                )
                .frame(height: 80)
                .padding()
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    CircularShapes_Stroke()
}
