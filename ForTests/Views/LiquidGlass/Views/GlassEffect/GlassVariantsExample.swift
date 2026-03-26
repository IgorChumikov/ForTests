//
//  GlassVariantsExample.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.03.2026.
//

import SwiftUI

/// Demonstrates the two variants of Liquid Glass: Regular and Clear.
/// - Regular: blurs and adjusts luminosity for legibility.
/// - Clear: highly translucent, ideal for media backgrounds.
@available(iOS 26.0, *)
struct GlassVariantsExample: View {

    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                // Regular variant
                ZStack {
                    Image(systemName: "mountain.2.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.green, .blue],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                        .clipped()

                    VStack(spacing: 8) {
                        Text(".regular")
                            .font(.title2.bold())
                        Text("Blurs background for legibility")
                            .font(.caption)
                    }
                    .padding()
                    .glassEffect(.regular, in: .rect(cornerRadius: 16))
                }
                .clipShape(.rect(cornerRadius: 20))
                .padding(.horizontal)

                // Clear variant
                ZStack {
                    Image(systemName: "photo.artframe")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.orange, .pink, .purple],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .clipped()

                    VStack(spacing: 8) {
                        Text(".clear")
                            .font(.title2.bold())
                        Text("Highly translucent for rich backgrounds")
                            .font(.caption)
                    }
                    .padding()
                    .glassEffect(.clear, in: .rect(cornerRadius: 16))
                    .background(.black.opacity(0.3))
                    .clipShape(.rect(cornerRadius: 16))
                }
                .clipShape(.rect(cornerRadius: 20))
                .padding(.horizontal)

                // Side by side comparison
                VStack(alignment: .leading, spacing: 12) {
                    Text("Comparison")
                        .font(.headline)
                        .padding(.horizontal)

                    ZStack {
                        LinearGradient(
                            colors: [.red, .orange, .yellow],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .frame(height: 200)

                        HStack(spacing: 20) {
                            VStack {
                                Image(systemName: "sun.max.fill")
                                    .font(.largeTitle)
                                Text("Regular")
                                    .font(.caption)
                            }
                            .padding()
                            .glassEffect(.regular, in: .rect(cornerRadius: 12))

                            VStack {
                                Image(systemName: "moon.fill")
                                    .font(.largeTitle)
                                Text("Clear")
                                    .font(.caption)
                            }
                            .padding()
                            .glassEffect(.clear, in: .rect(cornerRadius: 12))
                        }
                    }
                    .clipShape(.rect(cornerRadius: 20))
                    .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
        .navigationTitle("Glass Variants")
    }
}

@available(iOS 26.0, *)
#Preview {
    NavigationStack {
        GlassVariantsExample()
    }
}
