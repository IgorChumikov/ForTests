//
//  Canvas_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Canvas — базовое использование (iOS 15+)

 • Canvas используется для кастомного рисования в SwiftUI.
 • Внутри есть context — инструмент рисования (как CoreGraphics).
 • size — размер области, в которой рисуем.
 • Можно рисовать фигуры, линии, изображения и т.д.
*/

import SwiftUI

struct Canvas_Intro: View {

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            
            HeaderView3(
                title: "Canvas",
                subtitle: "Introduction",
                desc: "Use Canvas when you need custom drawing.",
                back: .brown,
                textColor: .white
            )
            
            // MARK: - Canvas пример
            Canvas { context, size in
                
                // MARK: - Рисуем круг
                let rect = CGRect(
                    x: 4,
                    y: 4,
                    width: size.width - 8,
                    height: size.height - 8
                )
                
                let path = Path(ellipseIn: rect)
                
                context.stroke(
                    path,
                    with: .color(.red),
                    lineWidth: 4
                )
                
                // MARK: - Добавляем иконку в центр
                let image = Image(systemName: "scribble.variable")
                
                context.draw(
                    image,
                    at: CGPoint(
                        x: size.width / 2,
                        y: size.height / 2
                    )
                )
            }
            .frame(width: 200, height: 200)
            .padding()
            
            DescView(desc: "Canvas lets you draw custom shapes and images.")
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    Canvas_Intro()
}
