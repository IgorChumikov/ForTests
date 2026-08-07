//
//  AngularGradient_Introduction.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.11.2025.
//

/*
 AngularGradient — круговой градиент (iOS 15+)

 • Цвета располагаются по кругу вокруг центра
 • Можно менять центр (center)
 • Можно вращать через angle
 • Отлично подходит для progress, кругов, эффектов
*/

import SwiftUI

struct AngularGradient_Introduction: View {

    // MARK: - Body
    var body: some View {

        // MARK: - Gradient setup
        let gradient = Gradient(colors: [.pink, .purple, .pink])

        let angularGradient = AngularGradient(
            gradient: gradient,
            center: .center,
            angle: .degrees(0)
        )

        let nonCenteredAngularGradient = AngularGradient(
            gradient: gradient,
            center: .bottomTrailing, // 🔴 смещаем центр
            angle: .degrees(0)
        )

        return VStack(spacing: 20) {

            // MARK: - Header
            Text("Angular Gradient")
                .font(.largeTitle)

            Text("Introduction")
                .font(.title)
                .foregroundStyle(.gray)

            Text("Angular gradients circle around a center point")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundStyle(.white)

            // MARK: - Центр по умолчанию
            Rectangle()
                .fill(angularGradient) // 🔴 центр = .center
                .frame(height: 200)

            Text("The center point can be changed. Here, it is moved to the bottom trailing:")

            // MARK: - Смещённый центр
            Rectangle()
                .fill(nonCenteredAngularGradient) // 🔴 центр = bottomTrailing
                .frame(height: 200)
        }
        .padding()
        .font(.title)
    }
}

#Preview {
    AngularGradient_Introduction()
}
