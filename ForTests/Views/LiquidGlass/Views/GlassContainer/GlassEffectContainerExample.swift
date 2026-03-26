//
//  GlassEffectContainerExample.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.03.2026.
//

import SwiftUI

/// Demonstrates GlassEffectContainer which combines multiple Liquid Glass
/// shapes into a single shape for better performance and morphing behavior.
/// The spacing parameter controls when shapes blend together.
@available(iOS 26.0, *)
struct GlassEffectContainerExample: View {

    @State private var spacing: CGFloat = 40.0
    @State private var contentSpacing: CGFloat = 40.0

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.mint, .teal, .cyan],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 24) {
                Text("Меняйте отступы, чтобы увидеть, как объединяются стеклянные формы")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                // Glass Effect Container with adjustable spacing
                GlassEffectContainer(spacing: spacing) {
                    HStack(spacing: contentSpacing) {
                        Image(systemName: "scribble.variable")
                            .frame(width: 80, height: 80)
                            .font(.system(size: 36))
                            .glassEffect()

                        Image(systemName: "eraser.fill")
                            .frame(width: 80, height: 80)
                            .font(.system(size: 36))
                            .glassEffect()

                        Image(systemName: "paintbrush.fill")
                            .frame(width: 80, height: 80)
                            .font(.system(size: 36))
                            .glassEffect()
                    }
                }

                Spacer()
                    .frame(height: 20)

                // Container spacing slider
                VStack(alignment: .leading, spacing: 8) {
                    Text("Отступ контейнера: \(Int(spacing))")
                        .font(.caption.monospaced())
                    Slider(value: $spacing, in: 0...100)
                }
                .padding()
                .glassEffect(in: .rect(cornerRadius: 16))
                .padding(.horizontal)

                // Content spacing slider
                VStack(alignment: .leading, spacing: 8) {
                    Text("Отступ содержимого: \(Int(contentSpacing))")
                        .font(.caption.monospaced())
                    Slider(value: $contentSpacing, in: 0...100)
                }
                .padding()
                .glassEffect(in: .rect(cornerRadius: 16))
                .padding(.horizontal)

                Text("Когда отступ контейнера больше или равен отступу содержимого,\nформы объединяются")
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
            }
            .padding(.vertical)
        }
        .navigationTitle("Стеклянный контейнер")
    }
}

@available(iOS 26.0, *)
#Preview {
    NavigationStack {
        GlassEffectContainerExample()
    }
}
