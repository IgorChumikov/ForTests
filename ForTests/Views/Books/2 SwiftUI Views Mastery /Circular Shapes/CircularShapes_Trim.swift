//
//  CircularShapes_Trim.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Trim — отображение части фигуры

 • .trim(from:to:) показывает только часть Shape.
 • Значения от 0 до 1 (0% → 100%).
 • Часто используется для прогресса.
*/

import SwiftUI

struct CircularShapes_Trim: View {

    // MARK: - Properties
    @State private var progress: CGFloat = 0.75
    
    private var percentage: Int {
        Int(progress * 100)
    }

    // MARK: - Body
    var body: some View {
        VStack(spacing: 30) {
            
            Text("Circular Shapes")
                .font(.largeTitle)
            
            Text("Trim")
                .foregroundStyle(.gray)
            
            // MARK: - Описание
            Text("Показывает только часть фигуры")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundStyle(.white)
            
            // MARK: - Круг прогресса
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color.purple,
                    style: StrokeStyle(
                        lineWidth: 30,
                        lineCap: .round
                    )
                )
                .frame(width: 200, height: 200)
                .rotationEffect(.degrees(-90)) // старт сверху
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
    CircularShapes_Trim()
}
