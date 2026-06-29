//
//  CircularShapes_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Circular Shapes — базовое использование

 • В SwiftUI есть 3 круглые фигуры: Circle, Capsule, Ellipse.
 • Все они — Shape и могут быть стилизованы (цвет, размер и т.д.).
 • По умолчанию используют primary цвет.
*/

import SwiftUI

struct CircularShapes_Intro: View {

    // MARK: - Body
    var body: some View {
        VStack(spacing: 10) {
            
            HeaderView3(
                title: "Круглые фигуры",
                subtitle: "Введение",
                desc: "В SwiftUI есть три вида круглых фигур:",
                back: .purple,
                textColor: .white
            )
            
            // MARK: - Circle
            Text("Circle")
            Circle()
                .frame(width: 100, height: 100)
                .padding()
            
            // MARK: - Capsule
            Text("Capsule")
            Capsule()
                .frame(width: 200, height: 60)
                .padding()
            
            // MARK: - Ellipse
            Text("Ellipse")
            Ellipse()
                .frame(width: 200, height: 100)
                .padding()
            
            // MARK: - Описание
            Text("Default color = primary")
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
    CircularShapes_Intro()
}
