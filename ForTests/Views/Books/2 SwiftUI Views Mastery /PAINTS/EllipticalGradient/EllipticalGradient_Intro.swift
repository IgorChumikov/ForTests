//
//  EllipticalGradient_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков
//

/*
 EllipticalGradient (iOS 15+)

 • Похож на RadialGradient
 • Но автоматически растягивается под размер контейнера
*/

import SwiftUI

struct EllipticalGradient_Intro: View {

    // MARK: - Properties
    let gradient = Gradient(colors: [.red, .blue])

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {

            // MARK: - Header
            HeaderView(
                "Elliptical Gradient",
                subtitle: "Introduction",
                desc: "The elliptical gradient is much like the radial gradient but it automatically conforms to the size of its container."
            )
            .layoutPriority(1)

            // MARK: - Elliptical Gradient
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(
                    .ellipticalGradient(
                        gradient,
                        center: .center
                    )
                )
                .overlay(
                    Text("Elliptical Gradient"),
                    alignment: .top
                )

            // MARK: - Radial Gradient (для сравнения)
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(
                    .radialGradient(
                        gradient,
                        center: .center,
                        startRadius: 10,
                        endRadius: 200
                    )
                )
                .overlay(
                    Text("Radial Gradient"),
                    alignment: .top
                )
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    EllipticalGradient_Intro()
}
