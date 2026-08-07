//
//  BackgroundExtensionExample.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.03.2026.
//

import SwiftUI

/// Demonstrates `.backgroundExtensionEffect()`.
/// This effect is subtle on iPhone and reads better in a wide layout,
/// so the demo exaggerates the sidebar seam and compares OFF vs ON.
@available(iOS 26.0, *)
struct BackgroundExtensionExample: View {

    var body: some View {
        ScrollView {
            VStack(spacing: 18) {
                LiquidGlassUsageCallout(
                    title: ".backgroundExtensionEffect()",
                    description: "Фон визуально продолжается под полупрозрачной боковой панелью. На iPhone эффект тонкий, на широком экране заметнее."
                )

                infoCard

                comparisonRow(
                    title: "Без эффекта",
                    subtitle: "Под полупрозрачной панелью фон обрывается визуально жёстче",
                    showExtension: false
                )

                comparisonRow(
                    title: "С эффектом",
                    subtitle: "Фон мягче продолжается под левой панелью",
                    showExtension: true
                )
            }
            .padding()
        }
        .background(
            LinearGradient(
                colors: [.indigo.opacity(0.12), .cyan.opacity(0.08), .orange.opacity(0.08)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
        )
        .navigationTitle("Расширение фона")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var infoCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Что смотреть")
                .font(.headline)

            Text("Смотрите на цветной фон прямо под левой полупрозрачной панелью.")
            Text("На iPhone разница слабая. На широком экране или iPad она заметнее.")
        }
        .font(.subheadline)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(18)
        .background(.regularMaterial, in: .rect(cornerRadius: 24))
    }

    private func comparisonRow(title: String, subtitle: String, showExtension: Bool) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)

            Text(subtitle)
                .font(.caption)
                .foregroundStyle(.secondary)

            HStack(spacing: 0) {
                sidebar

                seamDemo(showExtension: showExtension)
            }
            .frame(height: 260)
            .clipShape(.rect(cornerRadius: 28))
            .overlay(
                RoundedRectangle(cornerRadius: 28)
                    .stroke(.white.opacity(0.15), lineWidth: 1)
            )
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 28))
    }

    private var sidebar: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Папки", systemImage: "folder.fill")
            Label("Фото", systemImage: "photo.fill")
            Label("Избранное", systemImage: "star.fill")
            Label("Архив", systemImage: "archivebox.fill")

            Spacer()

            Text("Панель")
                .font(.caption.bold())
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(.white.opacity(0.14), in: Capsule())
        }
        .font(.subheadline.weight(.semibold))
        .foregroundStyle(.white)
        .frame(width: 140, alignment: .leading)
        .padding(16)
        .background(.ultraThinMaterial)
    }

    private func seamDemo(showExtension: Bool) -> some View {
        ZStack(alignment: .leading) {
            vividBackground(showExtension: showExtension)

            Rectangle()
                .fill(.white.opacity(showExtension ? 0.18 : 0.32))
                .frame(width: 8)

            VStack(alignment: .leading, spacing: 8) {
                Text(showExtension ? "ON" : "OFF")
                    .font(.caption.monospaced().bold())
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(.black.opacity(0.22), in: Capsule())

                Text("Область сравнения")
                    .font(.title3.bold())

                Text("Смотрите на цвет у самого стыка с левой панелью")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.92))
                    .frame(maxWidth: 170, alignment: .leading)
            }
            .foregroundStyle(.white)
            .padding(18)

            VStack {
                Spacer()

                HStack(spacing: 8) {
                    Image(systemName: "arrow.left")
                    Text("Стык")
                    Image(systemName: "arrow.right")
                }
                .font(.caption.bold())
                .foregroundStyle(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(.black.opacity(0.22), in: Capsule())
                .padding(.bottom, 16)
            }
            .frame(maxWidth: .infinity)
        }
    }

    private func vividBackground(showExtension: Bool) -> some View {
        ZStack {
            LinearGradient(
                colors: [.orange, .pink, .purple, .blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            Circle()
                .fill(.yellow.opacity(0.9))
                .frame(width: 190, height: 190)
                .offset(x: -55, y: -60)
                .blur(radius: 4)

            Circle()
                .fill(.mint.opacity(0.72))
                .frame(width: 180, height: 180)
                .offset(x: 90, y: 55)
                .blur(radius: 8)

            RoundedRectangle(cornerRadius: 38)
                .fill(.white.opacity(0.22))
                .frame(width: 160, height: 160)
                .rotationEffect(.degrees(16))
                .offset(x: 50, y: -12)
        }
        .if(showExtension) { view in
            view.backgroundExtensionEffect()
        }
    }
}

private extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

@available(iOS 26.0, *)
#Preview {
    NavigationStack {
        BackgroundExtensionExample()
    }
}
