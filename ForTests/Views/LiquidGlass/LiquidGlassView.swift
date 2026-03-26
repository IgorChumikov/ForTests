//
//  LiquidGlassView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.03.2026.
//

import SwiftUI

@available(iOS 26.0, *)
enum LiquidGlassExample: String, CaseIterable, Identifiable {

    var id: String { rawValue }

    // Glass Effect
    case basicGlassEffect = "Базовый стеклянный эффект"
    case glassEffectShapes = "Формы стеклянного эффекта"
    case glassVariants = "Варианты стекла (обычное и прозрачное)"
    case glassTint = "Цветовые оттенки стекла"
    case interactiveGlass = "Интерактивное стекло"

    // Glass Buttons
    case glassButtonStyles = "Стили стеклянных кнопок"

    // Glass Container
    case glassEffectContainer = "Контейнер стеклянного эффекта"
    case glassEffectUnion = "Объединение стеклянных эффектов"

    // Glass Morphing
    case glassMorphing = "Морфинг стеклянных переходов"
    case glassTransitionTypes = "Типы стеклянных переходов"

    // Scroll Effects
    case scrollEdgeEffect = "Эффект края при прокрутке"
    case backgroundExtension = "Эффект расширения фона"

    // Tab Bar
    case tabBarMinimize = "Сворачивание панели вкладок"
}

@available(iOS 26.0, *)
struct LiquidGlassView: View {

    @State private var showsTabBarMinimizeDemo = false

    var body: some View {
        NavigationStack {
            List {
                Section("Стеклянный эффект") {
                    ForEach([
                        LiquidGlassExample.basicGlassEffect,
                        .glassEffectShapes,
                        .glassVariants,
                        .glassTint,
                        .interactiveGlass
                    ]) { example in
                        NavigationLink(example.rawValue, value: example)
                    }
                }

                Section("Стеклянные кнопки") {
                    NavigationLink(
                        LiquidGlassExample.glassButtonStyles.rawValue,
                        value: LiquidGlassExample.glassButtonStyles
                    )
                }

                Section("Стеклянный контейнер") {
                    ForEach([
                        LiquidGlassExample.glassEffectContainer,
                        .glassEffectUnion
                    ]) { example in
                        NavigationLink(example.rawValue, value: example)
                    }
                }

                Section("Морфинг стекла") {
                    ForEach([
                        LiquidGlassExample.glassMorphing,
                        .glassTransitionTypes
                    ]) { example in
                        NavigationLink(example.rawValue, value: example)
                    }
                }

                Section("Эффекты прокрутки") {
                    ForEach([
                        LiquidGlassExample.scrollEdgeEffect,
                        .backgroundExtension
                    ]) { example in
                        NavigationLink(example.rawValue, value: example)
                    }
                }

                Section("Панель вкладок") {
                    Button {
                        showsTabBarMinimizeDemo = true
                    } label: {
                        HStack {
                            Text(LiquidGlassExample.tabBarMinimize.rawValue)
                                .foregroundStyle(.primary)

                            Spacer()

                            Image(systemName: "chevron.right")
                                .font(.footnote.weight(.semibold))
                                .foregroundStyle(.tertiary)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .navigationDestination(for: LiquidGlassExample.self) { example in
                switch example {
                case .basicGlassEffect:
                    BasicGlassEffectExample()
                case .glassEffectShapes:
                    GlassEffectShapesExample()
                case .glassVariants:
                    GlassVariantsExample()
                case .glassTint:
                    GlassTintExample()
                case .interactiveGlass:
                    InteractiveGlassExample()
                case .glassButtonStyles:
                    GlassButtonStylesExample()
                case .glassEffectContainer:
                    GlassEffectContainerExample()
                case .glassEffectUnion:
                    GlassEffectUnionExample()
                case .glassMorphing:
                    GlassMorphingExample()
                case .glassTransitionTypes:
                    GlassTransitionTypesExample()
                case .scrollEdgeEffect:
                    ScrollEdgeEffectExample()
                case .backgroundExtension:
                    BackgroundExtensionExample()
                case .tabBarMinimize:
                    EmptyView()
                }
            }
            .navigationTitle("Liquid Glass")
            .fullScreenCover(isPresented: $showsTabBarMinimizeDemo) {
                TabBarMinimizeDemoHost()
            }
        }
    }
}

@available(iOS 26.0, *)
struct LiquidGlassUsageCallout: View {

    let title: String
    let description: String

    var body: some View {
        VStack(spacing: 10) {
            Text(title)
                .font(.title3.bold())
                .multilineTextAlignment(.center)

            Text(description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 18)
        .padding(.vertical, 20)
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 28))
        .padding(.horizontal)
    }
}

@available(iOS 26.0, *)
private struct TabBarMinimizeDemoHost: View {

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack(alignment: .topTrailing) {
            TabBarMinimizeExample()

            Button("Закрыть") {
                dismiss()
            }
            .buttonStyle(.glassProminent)
            .padding(.top, 14)
            .padding(.trailing, 16)
        }
    }
}

@available(iOS 26.0, *)
#Preview {
    LiquidGlassView()
}
