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
                    LiquidGlassUsageCallout(
                        title: ".buttonStyle(.glass)",
                        description: "Стили системных стеклянных кнопок: обычная, акцентная, прозрачная и с оттенком."
                    )

                    // .glass style
                    Section {
                        Button("Стеклянная кнопка") {
                            lastTapped = "Стеклянная"
                        }
                        .buttonStyle(.glass)
                    } header: {
                        sectionHeader(".buttonStyle(.glass)")
                    }

                    // .glassProminent style
                    Section {
                        Button("Акцентное стекло") {
                            lastTapped = "Акцентная"
                        }
                        .buttonStyle(.glassProminent)
                    } header: {
                        sectionHeader(".buttonStyle(.glassProminent)")
                    }

                    // .glass(.clear) style
                    Section {
                        Button("Прозрачное стекло") {
                            lastTapped = "Прозрачная"
                        }
                        .buttonStyle(.glass(.clear))
                    } header: {
                        sectionHeader(".buttonStyle(.glass(.clear))")
                    }

                    // Tinted glass buttons
                    Section {
                        HStack(spacing: 16) {
                            Button {
                                lastTapped = "Синяя"
                            } label: {
                                Label("Синяя", systemImage: "drop.fill")
                            }
                            .buttonStyle(.glass(.regular.tint(.blue)))

                            Button {
                                lastTapped = "Оранжевая"
                            } label: {
                                Label("Оранжевая", systemImage: "flame.fill")
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
                                lastTapped = "Поделиться"
                            } label: {
                                Image(systemName: "square.and.arrow.up")
                            }
                            .buttonStyle(.glass)

                            Button {
                                lastTapped = "Лайк"
                            } label: {
                                Image(systemName: "heart.fill")
                            }
                            .buttonStyle(.glass)

                            Button {
                                lastTapped = "Закладка"
                            } label: {
                                Image(systemName: "bookmark.fill")
                            }
                            .buttonStyle(.glass)
                        }
                        .font(.title2)
                    } header: {
                        sectionHeader("Иконки-кнопки со стеклом")
                    }

                    // Destructive role button
                    Section {
                        Button("Удалить элемент", role: .destructive) {
                            lastTapped = "Удаление"
                        }
                        .buttonStyle(.glass)
                    } header: {
                        sectionHeader("Кнопка с разрушительным действием")
                    }

                    if !lastTapped.isEmpty {
                        Text("Последнее нажатие: \(lastTapped)")
                            .font(.caption)
                            .padding()
                            .glassEffect(in: .rect(cornerRadius: 8))
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Стеклянные кнопки")
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
