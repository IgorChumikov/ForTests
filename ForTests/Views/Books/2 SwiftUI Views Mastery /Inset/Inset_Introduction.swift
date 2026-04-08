//
//  Inset_Introduction.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 inset — работает только с Shape (iOS 15+)

 • Добавляет внутренний отступ у фигуры
 • Уменьшает сам Path внутри frame
 • Не изменяет размер View (в отличие от padding)
 • Часто используется со strokeBorder
*/

import SwiftUI

struct Inset_Introduction: View {

    // MARK: - Properties
    @State private var insetAmount: CGFloat = 45

    // MARK: - Body
    var body: some View {
        VStack(spacing: 10) {

            // MARK: - Header
            Text("Inset")
                .font(.largeTitle)

            Text("Introduction")
                .foregroundStyle(.gray)

            Text("Inset applies only to shapes. It allows you to add padding between the edge of the frame and the shape itself.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundStyle(.white)

            // MARK: - Пример с Circle
            Text("Inset by 20")

            Circle()
                .inset(by: 20) // 🔴 уменьшает круг внутрь
                .fill(Color.purple)
                .frame(width: 200)
                .border(Color.purple)

            // MARK: - Интерактивный пример
            Text("Slide to Adjust Inset")

            Rectangle()
                .inset(by: insetAmount) // 🔴 динамический inset
                .fill(Color.purple)
                .frame(width: 300, height: 200)
                .border(Color.purple)

            // MARK: - Slider
            HStack {
                Text("0")

                Slider(value: $insetAmount, in: 0...95)

                Text("95")
            }
            .padding()
        }
        .font(.title)
    }
}

#Preview {
    Inset_Introduction()
}
