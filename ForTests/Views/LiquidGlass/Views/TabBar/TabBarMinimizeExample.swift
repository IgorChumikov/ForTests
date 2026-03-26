//
//  TabBarMinimizeExample.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.03.2026.
//

import SwiftUI

/// Demonstrates tab bar minimization behavior with a more obvious scroll scenario.
@available(iOS 26.0, *)
struct TabBarMinimizeExample: View {

    @State private var selectedTab = 0
    @State private var scrollOffset: CGFloat = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                ScrollView {
                    VStack(spacing: 18) {
                        offsetReader

                        heroCard

                        hintCard

                        LazyVStack(spacing: 16) {
                            ForEach(1...24, id: \.self) { index in
                                postCard(index: index)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 12)
                }
                .background(
                    LinearGradient(
                        colors: [.cyan.opacity(0.12), .indigo.opacity(0.08), .orange.opacity(0.08)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()
                )
                .coordinateSpace(name: "scroll")
                .navigationTitle("Главная")
            }
            .tabItem {
                Label("Главная", systemImage: "house.fill")
            }
            .tag(0)

            NavigationStack {
                ContentUnavailableView(
                    "Поиск",
                    systemImage: "magnifyingglass",
                    description: Text("Откройте вкладку «Главная» и прокрутите список вниз")
                )
                .navigationTitle("Поиск")
            }
            .tabItem {
                Label("Поиск", systemImage: "magnifyingglass")
            }
            .tag(1)

            NavigationStack {
                ContentUnavailableView(
                    "Профиль",
                    systemImage: "person.fill",
                    description: Text("Нижняя панель сворачивается при прокрутке вниз")
                )
                .navigationTitle("Профиль")
            }
            .tabItem {
                Label("Профиль", systemImage: "person.fill")
            }
            .tag(2)
        }
        .tabBarMinimizeBehavior(.onScrollDown)
    }

    private var offsetReader: some View {
        GeometryReader { proxy in
            Color.clear
                .preference(key: ScrollOffsetKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        .onPreferenceChange(ScrollOffsetKey.self) { value in
            scrollOffset = value
        }
    }

    private var heroCard: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Сворачивание панели вкладок")
                .font(.title2.bold())

            Text("Прокрутите экран вниз. Когда контент начинает активно двигаться, системная панель вкладок внизу становится компактнее.")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            HStack(spacing: 12) {
                statusPill(
                    title: "Смещение",
                    value: "\(Int(abs(scrollOffset))) pt"
                )

                statusPill(
                    title: "Состояние",
                    value: scrollOffset < -40 ? "Должна сворачиваться" : "Полный размер"
                )
            }
        }
        .padding(20)
        .background(.regularMaterial, in: .rect(cornerRadius: 28))
    }

    private var hintCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            Label("Как проверить", systemImage: "hand.draw.fill")
                .font(.headline)

            Text("1. Останьтесь на вкладке «Главная».")
            Text("2. Быстро прокрутите список вниз на несколько карточек.")
            Text("3. Посмотрите на нижнюю системную панель: она должна стать меньше.")
        }
        .font(.subheadline)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(18)
        .background(.thinMaterial, in: .rect(cornerRadius: 24))
    }

    private func postCard(index: Int) -> some View {
        HStack(spacing: 14) {
            RoundedRectangle(cornerRadius: 18)
                .fill(
                    LinearGradient(
                        colors: [.blue.opacity(0.95), .cyan.opacity(0.7)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 78, height: 78)
                .overlay {
                    Image(systemName: index.isMultiple(of: 2) ? "sparkles" : "photo")
                        .font(.title2)
                        .foregroundStyle(.white)
                }

            VStack(alignment: .leading, spacing: 6) {
                Text("Карточка \(index)")
                    .font(.headline)

                Text(index <= 2 ? "Эти крупные карточки нужны, чтобы сворачивание панели было заметнее." : "Продолжайте прокрутку вниз и следите за нижней панелью вкладок.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding(16)
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 24))
    }

    private func statusPill(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)

            Text(value)
                .font(.subheadline.weight(.semibold))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(.thinMaterial, in: .rect(cornerRadius: 18))
    }
}

private struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

@available(iOS 26.0, *)
#Preview {
    TabBarMinimizeExample()
}
