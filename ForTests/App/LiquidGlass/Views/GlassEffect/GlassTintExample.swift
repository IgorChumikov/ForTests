//
//  GlassTintExample.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.03.2026.
//

import SwiftUI

/// Demonstrates tinted Liquid Glass effects.
/// Tints give the appearance of colored or stained glass,
/// useful for drawing emphasis to specific controls.
@available(iOS 26.0, *)
struct GlassTintExample: View {

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.gray.opacity(0.3), .gray.opacity(0.1)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 24) {
                    LiquidGlassUsageCallout(
                        title: ".glassEffect(.regular.tint(...))",
                        description: "Добавляем цветной оттенок к стеклу, чтобы сильнее выделить элемент."
                    )

                    Text("Стеклянные эффекты с оттенком")
                        .font(.title2.bold())
                        .padding(.top)

                    // Various tint colors
                    Group {
                        Label("Синий оттенок", systemImage: "drop.fill")
                            .padding()
                            .glassEffect(.regular.tint(.blue))

                        Label("Оранжевый оттенок", systemImage: "flame.fill")
                            .padding()
                            .glassEffect(.regular.tint(.orange))

                        Label("Зелёный оттенок", systemImage: "leaf.fill")
                            .padding()
                            .glassEffect(.regular.tint(.green))

                        Label("Красный оттенок", systemImage: "heart.fill")
                            .padding()
                            .glassEffect(.regular.tint(.red))

                        Label("Фиолетовый оттенок", systemImage: "wand.and.stars")
                            .padding()
                            .glassEffect(.regular.tint(.purple))

                        Label("Розовый оттенок", systemImage: "sparkles")
                            .padding()
                            .glassEffect(.regular.tint(.pink))
                    }
                    .font(.headline)

                    Divider()
                        .padding(.horizontal)

                    Text("Оттенок с пользовательскими формами")
                        .font(.title3.bold())

                    // Tinted glass with different shapes
                    HStack(spacing: 16) {
                        Image(systemName: "bell.fill")
                            .font(.title)
                            .frame(width: 60, height: 60)
                            .glassEffect(
                                .regular.tint(.cyan),
                                in: .circle
                            )

                        Image(systemName: "gear")
                            .font(.title)
                            .frame(width: 60, height: 60)
                            .glassEffect(
                                .regular.tint(.mint),
                                in: .rect(cornerRadius: 12)
                            )

                        Image(systemName: "star.fill")
                            .font(.title)
                            .frame(width: 60, height: 60)
                            .glassEffect(
                                .regular.tint(.yellow),
                                in: .circle
                            )
                    }

                    Divider()
                        .padding(.horizontal)

                    Text("Прозрачный вариант с оттенком")
                        .font(.title3.bold())

                    HStack(spacing: 16) {
                        Text("Прозрачный + синий")
                            .font(.caption)
                            .padding()
                            .glassEffect(.clear.tint(.blue), in: .rect(cornerRadius: 12))

                        Text("Прозрачный + розовый")
                            .font(.caption)
                            .padding()
                            .glassEffect(.clear.tint(.pink), in: .rect(cornerRadius: 12))
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Оттенок стекла")
    }
}

@available(iOS 26.0, *)
#Preview {
    NavigationStack {
        GlassTintExample()
    }
}
