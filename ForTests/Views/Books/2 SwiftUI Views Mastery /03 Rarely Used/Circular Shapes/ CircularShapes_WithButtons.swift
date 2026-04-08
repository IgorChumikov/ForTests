//
//  CircularShapes_WithButtons.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Shapes + Buttons (iOS 15+)

 • Можно применять Shape к другим View через .background(..., in: Shape).
 • Capsule часто используется для кнопок.
 • Circle — для круглых кнопок (иконки).
 • Модификатор .background(_:in:) доступен с iOS 15.
*/

import SwiftUI

struct CircularShapes_WithButtons: View {

    // MARK: - Body
    var body: some View {
        VStack(spacing: 30) {
            
            Text("Circular Shapes")
                .font(.largeTitle)
            
            Text("С кнопками")
                .foregroundStyle(.gray)
            
            // MARK: - Описание
            Text("Фигуры можно применять к кнопкам через background")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundStyle(.white)
            
            // MARK: - Capsule с обводкой
            Button("Use the Capsule shape") {}
                .padding()
                .background(
                    Capsule().stroke(Color.purple)
                )
            
            // MARK: - Capsule с заливкой
            Button("Use the Capsule shape") {}
                .foregroundStyle(.white)
                .padding()
                .background(
                    Capsule().fill(Color.purple)
                )
            
            // MARK: - Круглая кнопка
            Text("Circle + Button")
            
            Button {
            } label: {
                Image(systemName: "circle.grid.hex.fill")
                    .font(.title)
                    .padding()
            }
            .background(
                Circle().fill(Color.purple)
            )
            .foregroundStyle(.white)
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    CircularShapes_WithButtons()
}
