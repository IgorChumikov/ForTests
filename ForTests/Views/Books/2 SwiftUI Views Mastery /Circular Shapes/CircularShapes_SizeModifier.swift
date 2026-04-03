//
//  CircularShapes_SizeModifier.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Size Modifier

 • .size() задаёт ширину и высоту фигуры.
 • Может ломать выравнивание (не центрирует).
 • В большинстве случаев лучше использовать .frame().
*/

import SwiftUI

struct CircularShapes_SizeModifier: View {

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Circular Shapes")
                .font(.largeTitle)
            
            Text("Size Modifier")
                .foregroundStyle(.gray)
            
            // MARK: - Описание
            Text("size задаёт размер, но может ломать выравнивание")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundStyle(.white)
            
            // MARK: - Пример size
            Text(".size(width: 80, height: 80)")
            
            Circle()
                .size(width: 80, height: 80)
                .background(Color.purple)
            
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    CircularShapes_SizeModifier()
}
