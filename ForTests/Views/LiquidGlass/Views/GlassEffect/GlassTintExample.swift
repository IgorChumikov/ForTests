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
                    Text("Tinted Glass Effects")
                        .font(.title2.bold())
                        .padding(.top)

                    // Various tint colors
                    Group {
                        Label("Blue Tint", systemImage: "drop.fill")
                            .padding()
                            .glassEffect(.regular.tint(.blue))

                        Label("Orange Tint", systemImage: "flame.fill")
                            .padding()
                            .glassEffect(.regular.tint(.orange))

                        Label("Green Tint", systemImage: "leaf.fill")
                            .padding()
                            .glassEffect(.regular.tint(.green))

                        Label("Red Tint", systemImage: "heart.fill")
                            .padding()
                            .glassEffect(.regular.tint(.red))

                        Label("Purple Tint", systemImage: "wand.and.stars")
                            .padding()
                            .glassEffect(.regular.tint(.purple))

                        Label("Pink Tint", systemImage: "sparkles")
                            .padding()
                            .glassEffect(.regular.tint(.pink))
                    }
                    .font(.headline)

                    Divider()
                        .padding(.horizontal)

                    Text("Tint with Custom Shapes")
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

                    Text("Clear Variant with Tint")
                        .font(.title3.bold())

                    HStack(spacing: 16) {
                        Text("Clear + Blue")
                            .font(.caption)
                            .padding()
                            .glassEffect(.clear.tint(.blue), in: .rect(cornerRadius: 12))

                        Text("Clear + Pink")
                            .font(.caption)
                            .padding()
                            .glassEffect(.clear.tint(.pink), in: .rect(cornerRadius: 12))
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Glass Tint")
    }
}

@available(iOS 26.0, *)
#Preview {
    NavigationStack {
        GlassTintExample()
    }
}
