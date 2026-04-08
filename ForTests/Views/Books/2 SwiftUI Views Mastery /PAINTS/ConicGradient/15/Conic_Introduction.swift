//
//  Conic_Introduction.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 ConicGradient (iOS 15+)

 • Похож на AngularGradient
 • Угол (angle) можно не указывать
 • Используется через .foregroundStyle()
 • Новый API (более современный способ работы с градиентами)
*/

import SwiftUI

struct Conic_Introduction: View {

    // MARK: - Properties
    let gradient = Gradient(colors: [.green, .blue])

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {

            // MARK: - Header
            Text("Conic Gradient")
                .font(.largeTitle)

            Text("Introduction")
                .foregroundStyle(.gray)

            Text("The conic gradient is much like the angular gradient but angle is optional.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.brown)
                .foregroundStyle(.white)

            // MARK: - Conic Gradient
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(
                    .conicGradient(gradient, center: .center) // 🔴 новый стиль
                )
                .overlay(
                    Text("Conic Gradient"),
                    alignment: .top
                )

            // MARK: - Angular Gradient (для сравнения)
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(
                    .angularGradient(
                        gradient,
                        center: .center,
                        startAngle: .degrees(90),
                        endAngle: .degrees(270)
                    )
                )
                .overlay(
                    Text("Angular Gradient"),
                    alignment: .top
                )
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Conic_Introduction()
}
