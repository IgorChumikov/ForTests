//
//  GlassEffectShapesExample.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.03.2026.
//

import SwiftUI

/// Demonstrates glass effects with different shapes.
/// By default the shape is Capsule, but you can use any Shape.
@available(iOS 26.0, *)
struct GlassEffectShapesExample: View {

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.teal, .blue, .indigo],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 30) {
                    // Default Capsule shape
                    Text("По умолчанию (капсула)")
                        .font(.headline)
                        .padding()
                        .glassEffect()

                    // Rounded Rectangle
                    Text("Скруглённый прямоугольник")
                        .font(.headline)
                        .padding()
                        .frame(width: 250)
                        .glassEffect(in: .rect(cornerRadius: 16))

                    // Circle
                    Image(systemName: "heart.fill")
                        .font(.system(size: 36))
                        .frame(width: 80, height: 80)
                        .glassEffect(in: .circle)

                    // Rectangle with no corner radius
                    Text("Прямоугольник")
                        .font(.headline)
                        .padding()
                        .frame(width: 250)
                        .glassEffect(in: .rect)

                    // Rounded Rectangle with custom corner radii
                    Text("Свои скругления")
                        .font(.headline)
                        .padding()
                        .frame(width: 250)
                        .glassEffect(
                            in: .rect(
                                topLeadingRadius: 20,
                                bottomLeadingRadius: 4,
                                bottomTrailingRadius: 20,
                                topTrailingRadius: 4
                            )
                        )

                    // Ellipse
                    Text("Форма эллипса")
                        .font(.headline)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 20)
                        .glassEffect(in: .ellipse)

                    // Large card-like area
                    VStack(spacing: 12) {
                        Image(systemName: "photo.artframe")
                            .font(.system(size: 40))
                        Text("Карточка со стеклом")
                            .font(.title3)
                        Text("Для крупных элементов удобно использовать скруглённые прямоугольники")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .padding(24)
                    .frame(maxWidth: .infinity)
                    .glassEffect(in: .rect(cornerRadius: 24))
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
        }
        .navigationTitle("Формы стекла")
    }
}

@available(iOS 26.0, *)
#Preview {
    NavigationStack {
        GlassEffectShapesExample()
    }
}
