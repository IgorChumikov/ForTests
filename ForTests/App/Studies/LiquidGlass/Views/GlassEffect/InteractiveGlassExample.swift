//
//  InteractiveGlassExample.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.03.2026.
//

import SwiftUI

/// Demonstrates interactive Liquid Glass effects.
/// Interactive glass reacts to touch and pointer interactions,
/// providing the same fluid reactions as glass buttons.
@available(iOS 26.0, *)
struct InteractiveGlassExample: View {

    @State private var tapCount = 0

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.indigo, .purple, .blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 30) {
                LiquidGlassUsageCallout(
                    title: ".glassEffect(.interactive())",
                    description: "Интерактивное стекло реагирует на нажатие и ощущается как живая стеклянная кнопка."
                )

                Text("Нажмите на интерактивные стеклянные элементы")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.8))

                // Interactive glass - reacts to touch
                Text("Интерактивное стекло")
                    .font(.title2)
                    .padding()
                    .glassEffect(.regular.interactive())

                // Interactive + tinted
                Label("Нажми меня!", systemImage: "hand.tap.fill")
                    .font(.title3)
                    .padding()
                    .glassEffect(.regular.tint(.orange).interactive())
                    .onTapGesture {
                        tapCount += 1
                    }

                // Non-interactive for comparison
                Text("Неинтерактивный вариант для сравнения")
                    .font(.body)
                    .padding()
                    .glassEffect(.regular)

                // Interactive with custom shape
                HStack(spacing: 20) {
                    ForEach(["play.fill", "pause.fill", "stop.fill"], id: \.self) { icon in
                        Image(systemName: icon)
                            .font(.title2)
                            .frame(width: 56, height: 56)
                            .glassEffect(.regular.interactive(), in: .circle)
                    }
                }

                if tapCount > 0 {
                    Text(tapCount == 1 ? "Нажато 1 раз" : "Нажато \(tapCount) раз")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))
                }
            }
        }
        .navigationTitle("Интерактивное стекло")
    }
}

@available(iOS 26.0, *)
#Preview {
    NavigationStack {
        InteractiveGlassExample()
    }
}
