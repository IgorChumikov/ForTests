//
//  CircularShapes_TrimSolid.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Trim + Fill

 • .trim() можно использовать с .fill().
 • В этом случае получается "сектор" круга.
 • Используется для диаграмм (pie chart).
*/

import SwiftUI

struct CircularShapes_TrimSolid: View {

    // MARK: - Properties
    @State private var progress: CGFloat = 0.6
    
    private var percentage: Int {
        Int(progress * 100)
    }

    // MARK: - Body
    var body: some View {
        VStack(spacing: 30) {
            
            Text("Circular Shapes")
                .font(.largeTitle)
            
            Text("Trim Solid Shapes")
                .foregroundStyle(.gray)
            
            // MARK: - Описание
            Text("Показывает часть закрашенной фигуры")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundStyle(.white)
            
            // MARK: - Сектор круга
            Circle()
                .trim(from: 0, to: progress)
                .fill(Color.purple)
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(-90))
                .overlay(
                    Text("\(percentage)%")
                        .font(.largeTitle)
                )
            
            // MARK: - Слайдер
            Slider(value: $progress)
        }
        .padding()
    }
}

#Preview {
    CircularShapes_TrimSolid()
}
