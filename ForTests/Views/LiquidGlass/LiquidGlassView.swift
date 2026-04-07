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

    case basicGlassEffect = "Базовый стеклянный эффект"
    case glassEffectShapes = "Формы стеклянного эффекта"
    case glassVariants = "Варианты стекла (обычное и прозрачное)"
    case glassTint = "Цветовые оттенки стекла"
    case interactiveGlass = "Интерактивное стекло"
    case glassButtonStyles = "Стили стеклянных кнопок"
    case glassEffectContainer = "Контейнер стеклянного эффекта"
    case glassEffectUnion = "Объединение стеклянных эффектов"
    case glassMorphing = "Морфинг стеклянных переходов"
    case glassTransitionTypes = "Типы стеклянных переходов"
    case scrollEdgeEffect = "Эффект края при прокрутке"
    case backgroundExtension = "Эффект расширения фона"
    case tabBarMinimize = "Сворачивание панели вкладок"
}

@available(iOS 26.0, *)
struct LiquidGlassView: View {

    @State private var showsTabBarMinimizeDemo = false
    @State private var searchText = ""

    private let sections: [LiquidGlassOverviewSection] = [
        .init(
            title: "Стеклянные поверхности",
            subtitle: "Базовые эффекты, формы, прозрачность и оттенки для экранов КонсультантПлюс.",
            icon: "sparkles.rectangle.stack.fill",
            accent: Color(red: 0.54, green: 0.44, blue: 0.78),
            examples: [
                .basicGlassEffect,
                .glassEffectShapes,
                .glassVariants,
                .glassTint,
                .interactiveGlass
            ]
        ),
        .init(
            title: "Кнопки и CTA",
            subtitle: "Сценарии для брендовых действий: открыть документ, перейти в раздел, сохранить.",
            icon: "button.programmable",
            accent: Color(red: 0.96, green: 0.42, blue: 0.10),
            examples: [
                .glassButtonStyles
            ]
        ),
        .init(
            title: "Контейнеры и группы",
            subtitle: "Как собирать несколько стеклянных элементов в один аккуратный UI-блок.",
            icon: "square.stack.3d.up.fill",
            accent: Color(red: 0.42, green: 0.54, blue: 0.88),
            examples: [
                .glassEffectContainer,
                .glassEffectUnion
            ]
        ),
        .init(
            title: "Переходы и движение",
            subtitle: "Морфинг и типы переходов для сценариев переключения режимов и быстрых панелей.",
            icon: "arrow.triangle.2.circlepath.circle.fill",
            accent: Color(red: 0.30, green: 0.65, blue: 0.56),
            examples: [
                .glassMorphing,
                .glassTransitionTypes
            ]
        ),
        .init(
            title: "Скролл и таббар",
            subtitle: "Поведение при прокрутке и вкладки, если показать более живой сценарий приложения.",
            icon: "rectangle.compress.vertical",
            accent: Color(red: 0.86, green: 0.54, blue: 0.16),
            examples: [
                .scrollEdgeEffect,
                .backgroundExtension
            ]
        )
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 18) {
                    heroHeader
                    searchCard
                    quickActionRow

                    LiquidGlassUsageCallout(
                        title: "Liquid Glass в стиле КонсультантПлюс",
                        description: "Обзорный экран собран как презентационный mockup: мягкий фирменный фон, юридические разделы, стеклянные кнопки и сценарии, которые можно показать дизайнерам."
                    )

                    ForEach(filteredSections) { section in
                        sectionCard(section)
                    }

                    consultantPreviewCard
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)
                .padding(.bottom, 120)
            }
            .background(backgroundView)
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
            .safeAreaInset(edge: .bottom) {
                bottomGlassBar
            }
            .toolbar(.hidden, for: .navigationBar)
            .fullScreenCover(isPresented: $showsTabBarMinimizeDemo) {
                TabBarMinimizeDemoHost()
            }
        }
    }

    private var filteredSections: [LiquidGlassOverviewSection] {
        guard searchText.isEmpty == false else { return sections }

        return sections.compactMap { section in
            let examples = section.examples.filter { example in
                example.rawValue.localizedCaseInsensitiveContains(searchText)
                    || section.title.localizedCaseInsensitiveContains(searchText)
                    || section.subtitle.localizedCaseInsensitiveContains(searchText)
            }

            guard examples.isEmpty == false else {
                return nil
            }

            return LiquidGlassOverviewSection(
                title: section.title,
                subtitle: section.subtitle,
                icon: section.icon,
                accent: section.accent,
                examples: examples
            )
        }
    }

    private var backgroundView: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.97, green: 0.95, blue: 0.99),
                    Color(red: 0.95, green: 0.94, blue: 0.98),
                    Color.white
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            Circle()
                .fill(Color(red: 0.98, green: 0.49, blue: 0.12).opacity(0.18))
                .frame(width: 240, height: 240)
                .blur(radius: 18)
                .offset(x: -110, y: -260)

            Circle()
                .fill(Color(red: 0.55, green: 0.44, blue: 0.78).opacity(0.20))
                .frame(width: 300, height: 300)
                .blur(radius: 24)
                .offset(x: 150, y: -180)

            RoundedRectangle(cornerRadius: 36, style: .continuous)
                .fill(Color.white.opacity(0.34))
                .frame(height: 200)
                .blur(radius: 26)
                .offset(y: 340)
        }
    }

    private var heroHeader: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top) {
                HStack(spacing: 14) {
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.75))
                            .frame(width: 56, height: 56)

                        Circle()
                            .stroke(Color(red: 0.96, green: 0.42, blue: 0.10), lineWidth: 2)
                            .frame(width: 56, height: 56)

                        Text("К+")
                            .font(.system(size: 24, weight: .black, design: .rounded))
                            .foregroundStyle(Color(red: 0.96, green: 0.42, blue: 0.10))
                    }

                    VStack(alignment: .leading, spacing: 2) {
                        Text("КонсультантПлюс")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundStyle(Color(red: 0.96, green: 0.42, blue: 0.10))

                        Text("Liquid Glass showcase для внутреннего просмотра")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }

                Spacer()

                Button {
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title3.weight(.bold))
                        .foregroundStyle(Color(red: 0.55, green: 0.44, blue: 0.78))
                        .frame(width: 48, height: 48)
                }
                .buttonStyle(.glass)
            }

            VStack(alignment: .leading, spacing: 10) {
                Text("Показать, как новый стеклянный язык может выглядеть в продукте, не теряя узнаваемость бренда.")
                    .font(.headline)
                    .foregroundStyle(Color.primary.opacity(0.92))

                HStack(spacing: 10) {
                    consultantTag("Фирменный оранжевый", tint: Color(red: 0.96, green: 0.42, blue: 0.10))
                    consultantTag("Мягкий сиреневый", tint: Color(red: 0.55, green: 0.44, blue: 0.78))
                    consultantTag("iOS 26", tint: Color(red: 0.25, green: 0.56, blue: 0.86))
                }
            }
        }
        .padding(20)
        .glassEffect(.regular.tint(Color.white.opacity(0.10)), in: .rect(cornerRadius: 30))
    }

    private var searchCard: some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .font(.title3.weight(.medium))
                .foregroundStyle(.secondary)

            TextField("Поиск по эффектам, кнопкам и переходам", text: $searchText)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()

            if searchText.isEmpty == false {
                Button {
                    searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.secondary)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 16)
        .background(Color.white.opacity(0.84), in: .rect(cornerRadius: 22))
        .overlay {
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .stroke(Color.white.opacity(0.55), lineWidth: 1)
        }
        .shadow(color: Color.black.opacity(0.04), radius: 14, y: 6)
    }

    private var quickActionRow: some View {
        GlassEffectContainer(spacing: 10) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    quickActionButton(
                        title: "Открыть demo",
                        systemImage: "play.fill",
                        tint: Color(red: 0.96, green: 0.42, blue: 0.10)
                    ) {
                        showsTabBarMinimizeDemo = true
                    }

                    quickActionButton(
                        title: "Кнопки",
                        systemImage: "hand.tap.fill",
                        tint: Color(red: 0.55, green: 0.44, blue: 0.78),
                        destination: .glassButtonStyles
                    )

                    quickActionButton(
                        title: "Морфинг",
                        systemImage: "sparkles",
                        tint: Color(red: 0.31, green: 0.63, blue: 0.55),
                        destination: .glassMorphing
                    )
                }
                .padding(.vertical, 2)
            }
        }
    }

    private var consultantPreviewCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Label("Быстрый продуктовый preview", systemImage: "rectangle.grid.2x2.fill")
                    .font(.headline.weight(.bold))
                    .foregroundStyle(.primary)

                Spacer()

                Text("концепт")
                    .font(.caption.weight(.bold))
                    .foregroundStyle(Color(red: 0.55, green: 0.44, blue: 0.78))
            }

            Text("Такой блок можно показать дизайнерам как направление: карточки разделов, мягкий фон, glass CTA и более современная верхняя зона без потери характера КонсультантПлюс.")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            HStack(spacing: 12) {
                previewMetric(title: "Разделов", value: "5", tint: Color(red: 0.96, green: 0.42, blue: 0.10))
                previewMetric(title: "CTA", value: "3", tint: Color(red: 0.55, green: 0.44, blue: 0.78))
                previewMetric(title: "Demo", value: "Live", tint: Color(red: 0.31, green: 0.63, blue: 0.55))
            }
        }
        .padding(20)
        .background(Color.white.opacity(0.82), in: .rect(cornerRadius: 28))
        .overlay {
            RoundedRectangle(cornerRadius: 28, style: .continuous)
                .stroke(Color.white.opacity(0.6), lineWidth: 1)
        }
        .shadow(color: Color.black.opacity(0.04), radius: 12, y: 6)
    }

    private var bottomGlassBar: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 2) {
                Text("Режим для показа коллегам")
                    .font(.headline)
                Text("Можно быстро открыть tab bar demo и посмотреть glass в более живом сценарии.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }

            Spacer(minLength: 8)

            Button("Открыть") {
                showsTabBarMinimizeDemo = true
            }
            .buttonStyle(.glassProminent)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(
            Color.clear
                .glassEffect(.regular.tint(Color.white.opacity(0.08)), in: .rect(cornerRadius: 28))
        )
        .padding(.horizontal, 16)
        .padding(.bottom, 8)
    }

    private func sectionCard(_ section: LiquidGlassOverviewSection) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top, spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .fill(section.accent.opacity(0.14))
                        .frame(width: 50, height: 50)

                    Image(systemName: section.icon)
                        .font(.title3.weight(.bold))
                        .foregroundStyle(section.accent)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(section.title)
                        .font(.title3.weight(.bold))

                    Text(section.subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                Spacer()

                Text("\(section.examples.count)")
                    .font(.headline.weight(.bold))
                    .foregroundStyle(section.accent)
            }

            VStack(spacing: 10) {
                ForEach(section.examples) { example in
                    NavigationLink(value: example) {
                        HStack(spacing: 12) {
                            Circle()
                                .fill(section.accent.opacity(0.16))
                                .frame(width: 36, height: 36)
                                .overlay {
                                    Image(systemName: icon(for: example))
                                        .font(.footnote.weight(.bold))
                                        .foregroundStyle(section.accent)
                                }

                            VStack(alignment: .leading, spacing: 2) {
                                Text(example.rawValue)
                                    .font(.body.weight(.medium))
                                    .foregroundStyle(.primary)

                                Text(description(for: example))
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                    .lineLimit(2)
                            }

                            Spacer()

                            Image(systemName: "chevron.right")
                                .font(.footnote.weight(.bold))
                                .foregroundStyle(.tertiary)
                        }
                        .padding(.horizontal, 14)
                        .padding(.vertical, 13)
                        .background(Color.white.opacity(0.80), in: .rect(cornerRadius: 20))
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(18)
        .background(Color.white.opacity(0.70), in: .rect(cornerRadius: 30))
        .overlay {
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .stroke(Color.white.opacity(0.65), lineWidth: 1)
        }
        .shadow(color: Color.black.opacity(0.04), radius: 14, y: 8)
    }

    private func quickActionButton(
        title: String,
        systemImage: String,
        tint: Color,
        destination: LiquidGlassExample? = nil,
        action: (() -> Void)? = nil
    ) -> some View {
        Group {
            if let destination {
                NavigationLink(value: destination) {
                    Label(title, systemImage: systemImage)
                        .font(.subheadline.weight(.semibold))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                }
                .buttonStyle(.glass(.regular.tint(tint)))
            } else {
                Button(action: {
                    action?()
                }) {
                    Label(title, systemImage: systemImage)
                        .font(.subheadline.weight(.semibold))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                }
                .buttonStyle(.glass(.regular.tint(tint)))
            }
        }
    }

    private func consultantTag(_ title: String, tint: Color) -> some View {
        Text(title)
            .font(.caption.weight(.semibold))
            .foregroundStyle(tint)
            .padding(.horizontal, 10)
            .padding(.vertical, 7)
            .background(tint.opacity(0.12), in: Capsule())
    }

    private func previewMetric(title: String, value: String, tint: Color) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(value)
                .font(.title2.weight(.bold))
                .foregroundStyle(tint)
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .background(tint.opacity(0.10), in: .rect(cornerRadius: 18))
    }

    private func icon(for example: LiquidGlassExample) -> String {
        switch example {
        case .basicGlassEffect:
            "sparkles"
        case .glassEffectShapes:
            "square.on.circle"
        case .glassVariants:
            "square.stack.3d.up"
        case .glassTint:
            "paintpalette.fill"
        case .interactiveGlass:
            "hand.tap"
        case .glassButtonStyles:
            "button.programmable"
        case .glassEffectContainer:
            "square.stack.3d.down.forward"
        case .glassEffectUnion:
            "point.3.connected.trianglepath.dotted"
        case .glassMorphing:
            "wand.and.stars"
        case .glassTransitionTypes:
            "arrow.left.and.right.circle"
        case .scrollEdgeEffect:
            "arrow.up.and.down.text.horizontal"
        case .backgroundExtension:
            "rectangle.expand.vertical"
        case .tabBarMinimize:
            "square.split.bottomhalf.filled"
        }
    }

    private func description(for example: LiquidGlassExample) -> String {
        switch example {
        case .basicGlassEffect:
            "Минимальный glass-модификатор для текста, иконок и контейнеров."
        case .glassEffectShapes:
            "Сравнение формы стекла: прямоугольник, круг, капсула и другие."
        case .glassVariants:
            "Когда брать regular, а когда clear для более воздушного интерфейса."
        case .glassTint:
            "Примеры подкрашенного стекла в фирменных и акцентных цветах."
        case .interactiveGlass:
            "Интерактивные элементы, которые визуально реагируют на касание."
        case .glassButtonStyles:
            "Набор стеклянных кнопок для продуктовых действий и CTA."
        case .glassEffectContainer:
            "Группировка нескольких glass-элементов в цельный блок."
        case .glassEffectUnion:
            "Объединение стеклянных эффектов в одну визуальную композицию."
        case .glassMorphing:
            "Плавное превращение элементов между состояниями интерфейса."
        case .glassTransitionTypes:
            "Разница между matchedGeometry, materialize и identity."
        case .scrollEdgeEffect:
            "Эффект прилипания стеклянных панелей на краях при скролле."
        case .backgroundExtension:
            "Расширение фона и мягкое поведение стекла на прокрутке."
        case .tabBarMinimize:
            "Сворачивание вкладок в живом демонстрационном сценарии."
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
private struct LiquidGlassOverviewSection: Identifiable {

    let title: String
    let subtitle: String
    let icon: String
    let accent: Color
    let examples: [LiquidGlassExample]

    var id: String { title }
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
