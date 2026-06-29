//
//  EllipticalGradient_SizeChanges.swift
//  ForTests
//

/*
 EllipticalGradient — Size Change (iOS 15+)

 • По умолчанию градиент растягивается под размер контейнера
 • Не требует указания радиуса
 • Меняет форму в зависимости от frame

 • Широкий контейнер → горизонтальный овал
 • Высокий контейнер → вертикальный овал
*/

import SwiftUI

struct EllipticalGradient_SizeChanges: View {

    // MARK: - Properties
    let gradient = Gradient(colors: [.green, .blue])

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {

            // MARK: - Header
            HeaderView(
                "Elliptical Gradient",
                subtitle: "Size Change",
                desc: "Without setting any other properties the elliptical gradient stretches to fill the available area."
            )
            .layoutPriority(1)

            // MARK: - Wide Rectangle
            // Градиент растягивается по ширине → становится "плоским"
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(
                    .ellipticalGradient(
                        gradient,
                        center: .center
                    )
                )
                .frame(height: 150)

            // MARK: - Tall Rectangle
            // Градиент растягивается по высоте → становится "вытянутым"
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(
                    .ellipticalGradient(
                        gradient,
                        center: .center
                    )
                )
                .frame(width: 150)
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    EllipticalGradient_SizeChanges()
}
