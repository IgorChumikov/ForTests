//
//  BackgroundExtensionExample.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.03.2026.
//

import SwiftUI

/// Demonstrates `.backgroundExtensionEffect()` in a side-by-side comparison.
/// The right card applies the effect so the vivid background visually continues
/// under the translucent sidebar.
@available(iOS 26.0, *)
struct BackgroundExtensionExample: View {

    @State private var showOnlyEnhanced = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    Text("Эффект лучше заметен на контрастном фоне под полупрозрачной боковой панелью.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)

                    Toggle("Показывать только вариант с эффектом", isOn: $showOnlyEnhanced)
                }
                .padding()
                .background(.regularMaterial, in: .rect(cornerRadius: 20))

                if !showOnlyEnhanced {
                    extensionCard(
                        title: "Без эффекта",
                        subtitle: "Под панелью фон выглядит обычным и менее связанным",
                        showExtension: false
                    )
                }

                extensionCard(
                    title: "С эффектом",
                    subtitle: "Фон визуально продолжается под боковой панелью",
                    showExtension: true
                )
            }
            .padding()
        }
        .background(
            LinearGradient(
                colors: [.indigo.opacity(0.15), .cyan.opacity(0.12), .pink.opacity(0.1)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
        )
        .navigationTitle("Расширение фона")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func extensionCard(title: String, subtitle: String, showExtension: Bool) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            Text(title)
                .font(.headline)

            Text(subtitle)
                .font(.caption)
                .foregroundStyle(.secondary)

            ZStack(alignment: .leading) {
                detailBackground(showExtension: showExtension)
                    .frame(height: 250)
                    .clipShape(.rect(cornerRadius: 28))

                sidebar
                    .padding(.leading, 12)
            }
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 28))
    }

    private var sidebar: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("Фото", systemImage: "photo.stack.fill")
            Label("Видео", systemImage: "video.fill")
            Label("Избранное", systemImage: "star.fill")
            Label("Архив", systemImage: "archivebox.fill")
        }
        .font(.subheadline.weight(.semibold))
        .foregroundStyle(.white)
        .frame(width: 150, alignment: .leading)
        .padding(16)
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 22))
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(.white.opacity(0.22), lineWidth: 1)
        )
    }

    private func detailBackground(showExtension: Bool) -> some View {
        ZStack {
            LinearGradient(
                colors: [.orange, .pink, .purple, .blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            Circle()
                .fill(.yellow.opacity(0.75))
                .frame(width: 180, height: 180)
                .offset(x: -72, y: -54)
                .blur(radius: 4)

            RoundedRectangle(cornerRadius: 36)
                .fill(.white.opacity(0.22))
                .frame(width: 170, height: 170)
                .rotationEffect(.degrees(18))
                .offset(x: 92, y: -18)

            Circle()
                .fill(.cyan.opacity(0.55))
                .frame(width: 210, height: 210)
                .offset(x: 110, y: 70)
                .blur(radius: 6)

            VStack(alignment: .trailing, spacing: 8) {
                Text(showExtension ? "ON" : "OFF")
                    .font(.caption.monospaced().bold())
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(.black.opacity(0.28), in: Capsule())

                Text("Яркий фон")
                    .font(.title3.bold())

                Text("Смотрите на область под левой панелью")
                    .font(.caption)
                    .multilineTextAlignment(.trailing)
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding(20)
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
