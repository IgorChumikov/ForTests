//
//  CircularShapes_Sizing.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Размеры фигур

 • Shapes — это push-out view (растягиваются).
 • Размер можно менять через padding или frame.
 • padding уменьшает фигуру внутрь.
 • frame задаёт конкретный размер.
*/

import SwiftUI

struct CircularShapes_Sizing: View {

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Circular Shapes")
                .font(.largeTitle)
            
            Text("Размеры")
                .foregroundStyle(.gray)
            
            // MARK: - Padding
            Text("Используем padding")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundStyle(.white)
            
            ZStack {
                Circle().fill(Color.red)
                Circle().fill(Color.white).padding(40)
                Circle().fill(Color.red).padding(60)
                Circle().fill(Color.white).padding(80)
            }
            .frame(width: 200, height: 200)
            
            // MARK: - Frame
            Text("Используем frame")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundStyle(.white)
            
            ZStack(alignment: .bottom) {
                Circle()
                    .fill(Color.secondary)
                    .frame(height: 250)
                
                Circle()
                    .fill(Color.secondary)
                    .frame(height: 200)
                
                Circle()
                    .fill(Color.secondary)
                    .frame(height: 150)
                
                Circle()
                    .fill(Color.secondary)
                    .frame(height: 100)
            }
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    CircularShapes_Sizing()
}
