//
//  AngularGradient_OnOtherControls.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 AngularGradient + Controls

 • Можно применять не только к Shape
 • Используется через .background() и .stroke()
 • Отлично подходит для кнопок и UI элементов
*/

import SwiftUI

struct AngularGradient_OnOtherControls: View {

    // MARK: - Body
    var body: some View {

        let gradient = Gradient(colors: [.pink, .purple, .pink])

        let angularGradient = AngularGradient(
            gradient: gradient,
            center: .center,
            angle: .degrees(0)
        )

        return VStack(spacing: 20) {

            // MARK: - Header
            Text("Angular Gradient")
                .font(.largeTitle)

            Text("On Other Views")
                .foregroundStyle(.gray)

            Text("Apply angular gradients to control views.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundStyle(.white)

            // MARK: - Background gradient
            Button(action: {}) {
                Text("Gradient on Background")
                    .foregroundStyle(Color.white)
                    .padding()
            }
            .padding(.horizontal)
            .background(
                Capsule()
                    .fill(angularGradient) // 🔴 градиент как фон
            )

            // MARK: - Border gradient
            Button(action: {}) {
                Text("Gradient on Border")
                    .padding()
            }
            .background(
                Capsule()
                    .stroke(angularGradient, lineWidth: 10) // 🔴 градиент как border
            )
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    AngularGradient_OnOtherControls()
}
