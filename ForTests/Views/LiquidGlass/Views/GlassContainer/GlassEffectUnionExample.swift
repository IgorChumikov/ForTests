//
//  GlassEffectUnionExample.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.03.2026.
//

import SwiftUI

/// Demonstrates glassEffectUnion which combines multiple glass effects
/// into a single shape, even when views are at rest. Views sharing
/// the same union ID will have their geometries merged into one capsule.
@available(iOS 26.0, *)
struct GlassEffectUnionExample: View {

    @Namespace private var namespace

    private let weatherSymbols = [
        "cloud.bolt.rain.fill",
        "sun.rain.fill",
        "moon.stars.fill",
        "moon.fill"
    ]

    private let musicSymbols = [
        "play.fill",
        "backward.fill",
        "forward.fill"
    ]

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.indigo, .purple, .blue],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 40) {
                LiquidGlassUsageCallout(
                    title: ".glassEffectUnion(id:namespace:)",
                    description: "Элементы с одинаковым union ID объединяются в одну общую стеклянную форму."
                )

                // Two groups with unions
                VStack(alignment: .leading, spacing: 8) {
                    Text("Погодные символы (2 группы)")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))

                    GlassEffectContainer(spacing: 20) {
                        HStack(spacing: 20) {
                            ForEach(weatherSymbols.indices, id: \.self) { index in
                                Image(systemName: weatherSymbols[index])
                                    .frame(width: 60, height: 60)
                                    .font(.system(size: 24))
                                    .glassEffect()
                                    .glassEffectUnion(
                                        id: index < 2 ? "weather1" : "weather2",
                                        namespace: namespace
                                    )
                            }
                        }
                    }
                }

                // Music controls as single union
                VStack(alignment: .leading, spacing: 8) {
                    Text("Управление музыкой (единое объединение)")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))

                    GlassEffectContainer(spacing: 16) {
                        HStack(spacing: 16) {
                            ForEach(musicSymbols, id: \.self) { symbol in
                                Image(systemName: symbol)
                                    .frame(width: 56, height: 56)
                                    .font(.system(size: 22))
                                    .glassEffect()
                                    .glassEffectUnion(
                                        id: "music",
                                        namespace: namespace
                                    )
                            }
                        }
                    }
                }

                // No union (for comparison)
                VStack(alignment: .leading, spacing: 8) {
                    Text("Без объединения (для сравнения)")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))

                    GlassEffectContainer(spacing: 20) {
                        HStack(spacing: 20) {
                            ForEach(["house.fill", "gear", "person.fill"], id: \.self) { symbol in
                                Image(systemName: symbol)
                                    .frame(width: 56, height: 56)
                                    .font(.system(size: 22))
                                    .glassEffect()
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Объединение стекла")
    }
}

@available(iOS 26.0, *)
#Preview {
    NavigationStack {
        GlassEffectUnionExample()
    }
}
