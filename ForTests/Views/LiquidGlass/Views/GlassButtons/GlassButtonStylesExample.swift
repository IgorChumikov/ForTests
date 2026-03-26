//
//  GlassButtonStylesExample.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.03.2026.
//

import SwiftUI

/// Demonstrates all Liquid Glass button styles:
/// - .glass - standard glass button
/// - .glassProminent - prominent glass button (accent color background)
/// - .glass(.clear) - clear glass button
/// - .glass(.regular.tint(.color)) - tinted glass button
@available(iOS 26.0, *)
struct GlassButtonStylesExample: View {

    @State private var lastTapped = ""

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.cyan.opacity(0.3), .blue.opacity(0.3), .purple.opacity(0.3)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 28) {
                    // .glass style
                    Section {
                        Button("Glass Button") {
                            lastTapped = "Glass"
                        }
                        .buttonStyle(.glass)
                    } header: {
                        sectionHeader(".buttonStyle(.glass)")
                    }

                    // .glassProminent style
                    Section {
                        Button("Prominent Glass") {
                            lastTapped = "Prominent"
                        }
                        .buttonStyle(.glassProminent)
                    } header: {
                        sectionHeader(".buttonStyle(.glassProminent)")
                    }

                    // .glass(.clear) style
                    Section {
                        Button("Clear Glass") {
                            lastTapped = "Clear"
                        }
                        .buttonStyle(.glass(.clear))
                    } header: {
                        sectionHeader(".buttonStyle(.glass(.clear))")
                    }

                    // Tinted glass buttons
                    Section {
                        HStack(spacing: 16) {
                            Button {
                                lastTapped = "Blue"
                            } label: {
                                Label("Blue", systemImage: "drop.fill")
                            }
                            .buttonStyle(.glass(.regular.tint(.blue)))

                            Button {
                                lastTapped = "Orange"
                            } label: {
                                Label("Orange", systemImage: "flame.fill")
                            }
                            .buttonStyle(.glass(.regular.tint(.orange)))
                        }
                    } header: {
                        sectionHeader(".glass(.regular.tint(...))")
                    }

                    // Buttons with icons
                    Section {
                        HStack(spacing: 16) {
                            Button {
                                lastTapped = "Share"
                            } label: {
                                Image(systemName: "square.and.arrow.up")
                            }
                            .buttonStyle(.glass)

                            Button {
                                lastTapped = "Heart"
                            } label: {
                                Image(systemName: "heart.fill")
                            }
                            .buttonStyle(.glass)

                            Button {
                                lastTapped = "Bookmark"
                            } label: {
                                Image(systemName: "bookmark.fill")
                            }
                            .buttonStyle(.glass)
                        }
                        .font(.title2)
                    } header: {
                        sectionHeader("Icon Buttons with Glass")
                    }

                    // Destructive role button
                    Section {
                        Button("Delete Item", role: .destructive) {
                            lastTapped = "Delete"
                        }
                        .buttonStyle(.glass)
                    } header: {
                        sectionHeader("Button with Destructive Role")
                    }

                    if !lastTapped.isEmpty {
                        Text("Last tapped: \(lastTapped)")
                            .font(.caption)
                            .padding()
                            .glassEffect(in: .rect(cornerRadius: 8))
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Glass Buttons")
    }

    private func sectionHeader(_ text: String) -> some View {
        Text(text)
            .font(.caption.monospaced())
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.secondary)
    }
}

@available(iOS 26.0, *)
#Preview {
    NavigationStack {
        GlassButtonStylesExample()
    }
}
