//
//  Inset_NegativeValues.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 inset — отрицательные значения

 • inset(by: -value) увеличивает shape
 • Shape выходит за пределы своего frame
 • Можно "расширить" фигуру наружу
 • Полезно для эффектов и кастомных UI
*/

import SwiftUI

struct Inset_NegativeValues: View {

    // MARK: - Properties
    @State private var insetAmount: CGFloat = 10

    // MARK: - Body
    var body: some View {
        VStack(spacing: 10) {

            // MARK: - Header
            Text("Inset")
                .font(.largeTitle)

            Text("Negative Values")
                .foregroundStyle(.gray)

            Text("You can EXTEND a shape past its frame by using a negative inset value.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundStyle(.white)

            // MARK: - Пример -20
            Text("Inset by -20")

            Circle()
                .inset(by: -20) // 🔴 увеличивает круг за пределы frame
                .fill(Color.purple)
                .frame(width: 100)
                .border(Color.purple)

            // MARK: - Интерактив
            Text("Slide to Adjust Inset")

            Rectangle()
                .inset(by: insetAmount) // 🔴 может быть и отрицательный
                .fill(Color.purple)
                .frame(width: 200, height: 200)
                .border(Color.purple)
                .padding(30)

            // MARK: - Slider
            HStack {
                Text("-100")

                Slider(value: $insetAmount, in: -100...20)

                Text("20")
            }
            .padding()
        }
        .font(.title)
    }
}

#Preview {
    Inset_NegativeValues()
}
