//
//  Rectangular_WithControls.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.04.2026.
//

/*
 Using Shapes with Controls

 • background — добавляет shape под view
 • можно делать кастомные кнопки и поля
*/

import SwiftUI

struct Rectangular_WithControls: View {

    @State private var text = "Rounded Rectangle with TextField"

    var body: some View {
        VStack(spacing: 20) {

            HeaderView3(
                title: "Rectangular Shapes",
                subtitle: "With Controls",
                desc: "Use shapes as background",
                back: .blue,
                textColor: .white
            )

            // MARK: - Кнопка с рамкой
            Button(action: {}) {
                Text("RoundedRectangle and Button")
                    .bold()
                    .padding()
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(.blue, lineWidth: 1)
            )
            .tint(.blue)

            // MARK: - Кнопка с заливкой
            Button(action: {}) {
                Text("RoundedRectangle and Button")
                    .foregroundStyle(.white)
                    .bold()
                    .padding()
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.blue)
            )

            // MARK: - TextField
            TextField("Placeholder Text", text: $text)
                .foregroundStyle(.white)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blue)
                )
                .padding()
        }
        .font(.title)
        .background(Color.black)
    }
}

#Preview {
    Rectangular_WithControls()
}
