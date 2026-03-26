//
//  BasicGlassEffectExample.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.03.2026.
//

import SwiftUI

/// Demonstrates the basic usage of .glassEffect() modifier.
/// The default variant is .regular with a Capsule shape.
@available(iOS 26.0, *)
struct BasicGlassEffectExample: View {

    var body: some View {
        ZStack {
            // Colorful background to show glass blur effect
            LinearGradient(
                colors: [.blue, .purple, .pink, .orange],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 30) {
                // Basic glass effect on Text
                Text("Hello, Liquid Glass!")
                    .font(.title)
                    .padding()
                    .glassEffect()

                // Glass effect on Label
                Label("Favorite", systemImage: "star.fill")
                    .font(.title2)
                    .padding()
                    .glassEffect()

                // Glass effect on Image
                Image(systemName: "apple.logo")
                    .font(.system(size: 48))
                    .padding()
                    .glassEffect()

                // Glass effect on HStack
                HStack(spacing: 16) {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .font(.title3)
                .padding()
                .glassEffect()
            }
        }
        .navigationTitle("Basic Glass Effect")
    }
}

@available(iOS 26.0, *)
#Preview {
    NavigationStack {
        BasicGlassEffectExample()
    }
}
