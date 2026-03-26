//
//  GlassTransitionTypesExample.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.03.2026.
//

import SwiftUI

/// Demonstrates the different GlassEffectTransition types:
/// - .matchedGeometry - shape derives from nearby shape's geometry
/// - .materialize - fades in content and animates glass material
/// - .identity - no transition changes
@available(iOS 26.0, *)
struct GlassTransitionTypesExample: View {

    @State private var showMatchedGeometry = false
    @State private var showMaterialize = false
    @State private var showIdentity = false

    @Namespace private var matchedNS
    @Namespace private var materializeNS
    @Namespace private var identityNS

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.teal, .cyan, .blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 40) {
                    // Matched Geometry Transition
                    VStack(spacing: 16) {
                        Text(".matchedGeometry")
                            .font(.headline)

                        Text("Shape morphs from/to nearby shapes")
                            .font(.caption)
                            .foregroundStyle(.secondary)

                        GlassEffectContainer(spacing: 40) {
                            HStack(spacing: 40) {
                                Image(systemName: "pencil")
                                    .frame(width: 64, height: 64)
                                    .font(.system(size: 28))
                                    .glassEffect()
                                    .glassEffectID("mg_pencil", in: matchedNS)

                                if showMatchedGeometry {
                                    Image(systemName: "note.text")
                                        .frame(width: 64, height: 64)
                                        .font(.system(size: 28))
                                        .glassEffect()
                                        .glassEffectID("mg_note", in: matchedNS)
                                        .glassEffectTransition(.matchedGeometry)
                                }
                            }
                        }

                        Button("Toggle") {
                            withAnimation {
                                showMatchedGeometry.toggle()
                            }
                        }
                        .buttonStyle(.glass)
                    }
                    .padding()
                    .glassEffect(in: .rect(cornerRadius: 20))
                    .padding(.horizontal)

                    // Materialize Transition
                    VStack(spacing: 16) {
                        Text(".materialize")
                            .font(.headline)

                        Text("Fades in content, animates glass material")
                            .font(.caption)
                            .foregroundStyle(.secondary)

                        GlassEffectContainer(spacing: 40) {
                            HStack(spacing: 40) {
                                Image(systemName: "music.note")
                                    .frame(width: 64, height: 64)
                                    .font(.system(size: 28))
                                    .glassEffect()
                                    .glassEffectID("mat_music", in: materializeNS)

                                if showMaterialize {
                                    Image(systemName: "music.note.list")
                                        .frame(width: 64, height: 64)
                                        .font(.system(size: 28))
                                        .glassEffect()
                                        .glassEffectID("mat_list", in: materializeNS)
                                        .glassEffectTransition(.materialize)
                                }
                            }
                        }

                        Button("Toggle") {
                            withAnimation {
                                showMaterialize.toggle()
                            }
                        }
                        .buttonStyle(.glass)
                    }
                    .padding()
                    .glassEffect(in: .rect(cornerRadius: 20))
                    .padding(.horizontal)

                    // Identity Transition
                    VStack(spacing: 16) {
                        Text(".identity")
                            .font(.headline)

                        Text("No transition changes applied")
                            .font(.caption)
                            .foregroundStyle(.secondary)

                        GlassEffectContainer(spacing: 40) {
                            HStack(spacing: 40) {
                                Image(systemName: "star.fill")
                                    .frame(width: 64, height: 64)
                                    .font(.system(size: 28))
                                    .glassEffect()
                                    .glassEffectID("id_star", in: identityNS)

                                if showIdentity {
                                    Image(systemName: "star.circle.fill")
                                        .frame(width: 64, height: 64)
                                        .font(.system(size: 28))
                                        .glassEffect()
                                        .glassEffectID("id_circle", in: identityNS)
                                        .glassEffectTransition(.identity)
                                }
                            }
                        }

                        Button("Toggle") {
                            withAnimation {
                                showIdentity.toggle()
                            }
                        }
                        .buttonStyle(.glass)
                    }
                    .padding()
                    .glassEffect(in: .rect(cornerRadius: 20))
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
        }
        .navigationTitle("Transition Types")
    }
}

@available(iOS 26.0, *)
#Preview {
    NavigationStack {
        GlassTransitionTypesExample()
    }
}
