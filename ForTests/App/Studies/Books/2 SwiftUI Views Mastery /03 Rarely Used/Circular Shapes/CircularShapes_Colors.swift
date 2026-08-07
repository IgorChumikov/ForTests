//
//  CircularShapes_Colors.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Цвет в Shape

 • Фигуры можно "заливать" цветом через .fill().
 • Также можно использовать .foregroundStyle().
 • .fill() работает только с Shape.
 • .foregroundStyle() — универсальный способ.
*/

import SwiftUI

struct CircularShapes_Colors: View {

    // MARK: - Body
    var body: some View {
        VStack(spacing: 10) {
            
            Text("Circular Shapes")
                .font(.largeTitle)
            
            Text("Цвета")
                .foregroundStyle(.gray)
            
            // MARK: - Описание
            Text("Фигуры можно закрашивать цветом или стилем.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundStyle(.white)
            
            // MARK: - fill
            Text("Используем .fill(Color.purple)")
            
            Circle()
                .fill(Color.purple)
                .frame(height: 100)
                .padding()
            
            // MARK: - foregroundStyle
            Text("Используем .foregroundStyle(.purple)")
            
            Circle()
                .foregroundStyle(.purple)
                .frame(height: 100)
                .padding()
            
            // MARK: - Важно
            Text("fill работает только с фигурами")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundStyle(.white)
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    CircularShapes_Colors()
}
