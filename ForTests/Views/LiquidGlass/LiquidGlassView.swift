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
    case basicGlassEffect = "Basic Glass Effect"
    case glassEffectShapes = "Glass Effect Shapes"
    case glassVariants = "Glass Variants (Regular vs Clear)"
    case glassTint = "Glass Tint Colors"
    case interactiveGlass = "Interactive Glass"

    // Glass Buttons
    case glassButtonStyles = "Glass Button Styles"

    // Glass Container
    case glassEffectContainer = "Glass Effect Container"
    case glassEffectUnion = "Glass Effect Union"

    // Glass Morphing
    case glassMorphing = "Glass Morphing Transitions"
    case glassTransitionTypes = "Glass Transition Types"

    // Scroll Effects
    case scrollEdgeEffect = "Scroll Edge Effect"
    case backgroundExtension = "Background Extension Effect"

    // Tab Bar
    case tabBarMinimize = "Tab Bar Minimize Behavior"
}

@available(iOS 26.0, *)
struct LiquidGlassView: View {

    var body: some View {
        NavigationStack {
            List {
                Section("Glass Effect") {
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

                Section("Glass Buttons") {
                    NavigationLink(
                        LiquidGlassExample.glassButtonStyles.rawValue,
                        value: LiquidGlassExample.glassButtonStyles
                    )
                }

                Section("Glass Container") {
                    ForEach([
                        LiquidGlassExample.glassEffectContainer,
                        .glassEffectUnion
                    ]) { example in
                        NavigationLink(example.rawValue, value: example)
                    }
                }

                Section("Glass Morphing") {
                    ForEach([
                        LiquidGlassExample.glassMorphing,
                        .glassTransitionTypes
                    ]) { example in
                        NavigationLink(example.rawValue, value: example)
                    }
                }

                Section("Scroll Effects") {
                    ForEach([
                        LiquidGlassExample.scrollEdgeEffect,
                        .backgroundExtension
                    ]) { example in
                        NavigationLink(example.rawValue, value: example)
                    }
                }

                Section("Tab Bar") {
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
