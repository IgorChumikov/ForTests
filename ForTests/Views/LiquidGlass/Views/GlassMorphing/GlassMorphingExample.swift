//
//  GlassMorphingExample.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.03.2026.
//

import SwiftUI

/// Demonstrates Liquid Glass morphing transitions using
/// GlassEffectContainer with glassEffectID.
/// When views appear/disappear, shapes morph into each other.
@available(iOS 26.0, *)
struct GlassMorphingExample: View {

    @State private var isExpanded = false
    @Namespace private var namespace

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.blue, .purple, .indigo],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 40) {
                LiquidGlassUsageCallout(
                    title: ".glassEffectID(..., in: namespace)",
                    description: "Связываем элементы через ID и namespace, чтобы стеклянная форма могла морфиться между ними."
                )

                Text("Нажмите «Переключить», чтобы увидеть морфинг")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.8))

                // Morphing toolbar example
                GlassEffectContainer(spacing: 40) {
                    HStack(spacing: 40) {
                        Image(systemName: "scribble.variable")
                            .frame(width: 80, height: 80)
                            .font(.system(size: 36))
                            .glassEffect()
                            .glassEffectID("pencil", in: namespace)

                        if isExpanded {
                            Image(systemName: "eraser.fill")
                                .frame(width: 80, height: 80)
                                .font(.system(size: 36))
                                .glassEffect()
                                .glassEffectID("eraser", in: namespace)
                        }
                    }
                }

                Button("Переключить") {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }
                .buttonStyle(.glass)

                Divider()
                    .frame(width: 200)
                    .background(.white.opacity(0.3))

                // More complex morphing example
                ToolbarMorphExample()
            }
        }
        .navigationTitle("Морфинг стекла")
    }
}

/// A more complex morphing example with multiple items
@available(iOS 26.0, *)
private struct ToolbarMorphExample: View {

    @State private var showAll = false
    @Namespace private var toolNamespace

    private let tools = [
        ("paintbrush.fill", "brush"),
        ("pencil", "pencil"),
        ("scissors", "scissors"),
        ("ruler", "ruler")
    ]

    var body: some View {
        VStack(spacing: 20) {
            Text("Морфинг панели инструментов")
                .font(.caption)
                .foregroundStyle(.white.opacity(0.7))

            GlassEffectContainer(spacing: 24) {
                HStack(spacing: 24) {
                    // First tool always visible
                    Image(systemName: tools[0].0)
                        .frame(width: 56, height: 56)
                        .font(.system(size: 24))
                        .glassEffect()
                        .glassEffectID(tools[0].1, in: toolNamespace)

                    if showAll {
                        ForEach(1..<tools.count, id: \.self) { index in
                            Image(systemName: tools[index].0)
                                .frame(width: 56, height: 56)
                                .font(.system(size: 24))
                                .glassEffect()
                                .glassEffectID(tools[index].1, in: toolNamespace)
                        }
                    }
                }
            }

            Button(showAll ? "Свернуть" : "Развернуть") {
                withAnimation(.spring) {
                    showAll.toggle()
                }
            }
            .buttonStyle(.glass(.regular.tint(.cyan)))
        }
    }
}

@available(iOS 26.0, *)
#Preview {
    NavigationStack {
        GlassMorphingExample()
    }
}
