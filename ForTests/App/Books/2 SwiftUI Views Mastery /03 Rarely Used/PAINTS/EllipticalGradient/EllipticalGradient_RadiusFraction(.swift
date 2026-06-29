//
//  EllipticalGradient_RadiusFraction.swift
//  ForTests
//

/*
 EllipticalGradient — Radius Fraction (iOS 15+)

 • Позволяет управлять диапазоном распространения цвета
 • Использует startRadiusFraction и endRadiusFraction

 • startRadiusFraction — где начинается градиент (0 = центр)
 • endRadiusFraction — где заканчивается (1 = край)

 • Позволяет делать мягкие переходы и spotlight эффекты
*/

import SwiftUI

struct EllipticalGradient_RadiusFraction: View {

    // MARK: - Properties
    let gradient = Gradient(colors: [.green, .blue])

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {

            // MARK: - Header
            HeaderView(
                "Elliptical Gradient",
                subtitle: "Radius Fraction",
                desc: "Use the radius fraction parameters to control the range of color spread in your gradient."
            )
            .layoutPriority(1)

            // MARK: - Custom Radius Fraction
            // Градиент ограничен внутри (не от центра до края)
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(
                    .ellipticalGradient(
                        gradient,
                        center: .center,
                        startRadiusFraction: 0.1,
                        endRadiusFraction: 0.9
                    )
                )
                .overlay(
                    Text("Radius Fractions"),
                    alignment: .top
                )

            // MARK: - Default Gradient
            // Градиент от центра до края (0 → 1)
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(
                    .ellipticalGradient(
                        gradient,
                        center: .center
                    )
                )
                .overlay(
                    Text("Default"),
                    alignment: .top
                )
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    EllipticalGradient_RadiusFraction()
}
