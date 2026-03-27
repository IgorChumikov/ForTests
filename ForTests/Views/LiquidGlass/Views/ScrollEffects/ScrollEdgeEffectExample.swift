//
//  ScrollEdgeEffectExample.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.03.2026.
//

import SwiftUI

/// Demonstrates scroll edge effects with glass controls pinned above colorful content.
/// The transition becomes much easier to see when bright cards slide under the glass bars.
@available(iOS 26.0, *)
struct ScrollEdgeEffectExample: View {

    @State private var selectedStyle = 2

    private let items = Array(1...18)

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.indigo.opacity(0.16), .cyan.opacity(0.1), .orange.opacity(0.08)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 0) {
                LiquidGlassUsageCallout(
                    title: ".scrollEdgeEffectStyle(...)",
                    description: "Смотрите на переход между яркими карточками и стеклянными панелями сверху и снизу."
                )

                Picker("Стиль края", selection: $selectedStyle) {
                    Text("Авто").tag(0)
                    Text("Мягкий").tag(1)
                    Text("Жёсткий").tag(2)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .padding(.bottom, 12)

                styledScrollContent
            }
        }
        .navigationTitle("Эффект края при прокрутке")
    }

    private var styledScrollContent: some View {
        Group {
            switch selectedStyle {
            case 1:
                scrollContent
                    .scrollEdgeEffectStyle(.soft, for: .all)
            case 2:
                scrollContent
                    .scrollEdgeEffectStyle(.hard, for: .all)
            default:
                scrollContent
                    .scrollEdgeEffectStyle(.automatic, for: .all)
            }
        }
    }

    private var scrollContent: some View {
        ScrollView {
            VStack(spacing: 16) {
                heroCard

                ForEach(items, id: \.self) { index in
                    exampleCard(index: index)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
        }
        .safeAreaInset(edge: .top, spacing: 0) {
            topGlassBar
                .padding(.horizontal)
                .padding(.bottom, 10)
        }
        .safeAreaInset(edge: .bottom, spacing: 0) {
            bottomGlassBar
                .padding(.horizontal)
                .padding(.top, 10)
        }
    }

    private var topGlassBar: some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)

            Text("Панель под стеклом")
                .font(.subheadline.weight(.semibold))

            Spacer()

            Image(systemName: "slider.horizontal.3")
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 22))
    }

    private var bottomGlassBar: some View {
        HStack(spacing: 12) {
            Image(systemName: "arrow.down.circle.fill")
                .foregroundStyle(.blue)

            Text("Прокрутите и смотрите на стык")
                .font(.subheadline.weight(.semibold))

            Spacer()

            Button("OK") { }
                .buttonStyle(.glassProminent)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 24))
    }

    private var heroCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Где видно лучше")
                .font(.headline)

            Text("Когда яркий контент уходит под стеклянные панели, мягкий и жёсткий край читаются заметно лучше.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(.regularMaterial, in: .rect(cornerRadius: 26))
    }

    private func exampleCard(index: Int) -> some View {
        let palette = cardPalette(for: index)

        return VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Карточка \(index)")
                    .font(.headline)

                Spacer()

                Text(index.isMultiple(of: 2) ? "Контраст" : "Цвет")
                    .font(.caption.bold())
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(.white.opacity(0.18), in: Capsule())
            }

            RoundedRectangle(cornerRadius: 24)
                .fill(
                    LinearGradient(
                        colors: palette,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(height: 150)
                .overlay(alignment: .bottomLeading) {
                    Text("Смотрите на верхний и нижний край во время прокрутки")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.white)
                        .padding(14)
                }
        }
        .foregroundStyle(.white)
        .padding(18)
        .background(
            LinearGradient(
                colors: palette.map { $0.opacity(0.95) },
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ),
            in: .rect(cornerRadius: 30)
        )
    }

    private func cardPalette(for index: Int) -> [Color] {
        switch index % 4 {
        case 0:
            return [.pink, .orange]
        case 1:
            return [.blue, .cyan]
        case 2:
            return [.purple, .indigo]
        default:
            return [.mint, .teal]
        }
    }
}

@available(iOS 26.0, *)
#Preview {
    NavigationStack {
        ScrollEdgeEffectExample()
    }
}
