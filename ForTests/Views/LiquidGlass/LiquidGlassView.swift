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
                    NavigationLink(
                        LiquidGlassExample.tabBarMinimize.rawValue,
                        value: LiquidGlassExample.tabBarMinimize
                    )
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
                    TabBarMinimizeExample()
                }
            }
            .navigationTitle("Liquid Glass")
        }
    }
}

@available(iOS 26.0, *)
#Preview {
    LiquidGlassView()
}
