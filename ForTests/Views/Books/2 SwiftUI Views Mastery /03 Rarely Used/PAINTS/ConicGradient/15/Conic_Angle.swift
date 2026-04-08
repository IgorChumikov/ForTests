//
//  Conic_Angle.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 ConicGradient — Angle

 • Параметр angle задаёт, откуда начинается градиент
 • Измеряется в градусах
 • Позволяет "поворачивать" градиент
*/

import SwiftUI

struct Conic_Angle: View {

    // MARK: - Properties
    let gradient = Gradient(colors: [.green, .blue])

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {

            // MARK: - Header
            HeaderView(
                "Conic Gradient",
                subtitle: "Angle",
                desc: "Use the angle parameter to set where the first color starts."
            )

            // MARK: - First Row
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(
                        .conicGradient(
                            gradient,
                            center: .center,
                            angle: .degrees(45)
                        )
                    )
                    .overlay(Text("45°"), alignment: .top)

                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(
                        .conicGradient(
                            gradient,
                            center: .center,
                            angle: .degrees(90)
                        )
                    )
                    .overlay(Text("90°"), alignment: .top)
            }

            // MARK: - Second Row
            HStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(
                        .conicGradient(
                            gradient,
                            center: .center,
                            angle: .degrees(180)
                        )
                    )
                    .overlay(Text("180°"), alignment: .top)

                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(
                        .conicGradient(
                            gradient,
                            center: .center,
                            angle: .degrees(270)
                        )
                    )
                    .overlay(Text("270°"), alignment: .top)
            }
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Conic_Angle()
}
