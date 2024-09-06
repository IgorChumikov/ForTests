//
//  ScrollablePanelView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 14.05.2024.
//

import SwiftUI

// MARK: - ScrollablePanelView

public struct ScrollablePanelView<Content: View>: View {
    // MARK: - Properties

    @Environment(\.bottomSheetMaxHeight)
    private var maxHeight: CGFloat

    @ViewBuilder
    private var content: () -> Content

    @State
    private var isScrollEnabled = true
    @State
    private var contentHeight: CGFloat = .zero
    @StateObject
    private var keyboardHelper = KeyboardHelper()
    @State
    private var contentSize: CGSize = .zero

    // MARK: - Computed Properties

    private var axes: Axis.Set {
        isScrollEnabled ? .vertical : []
    }

    // MARK: - Init

    public init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
    }

    // MARK: - Content

    public var body: some View {
        ScrollView(axes) {
            content()
                .contentSize(.dynamic) { size in
                    contentSize = size
                    updateContent()
                }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: isScrollEnabled ? .infinity : contentHeight
        )
        .onReceive(keyboardHelper.$keyboardStatus) { status in
            if status == .hidden || status == .shown {
                updateContent()
            }
        }
    }

    // MARK: - Functions

    private func updateContent() {
        if keyboardHelper.keyboardStatus == .shown,
           contentSize.height > maxHeight - keyboardHelper.keyboardHeight {
            contentHeight = contentSize.height - keyboardHelper.keyboardHeight
            isScrollEnabled = true
        } else {
            contentHeight = contentSize.height
            isScrollEnabled = contentSize.height > maxHeight
        }
    }
}

// MARK: - ScrollablePanelView_Previews

struct ScrollablePanelView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollablePanelView {
            Color
                .green
                .frame(height: 200)
        }
    }
}


public extension EnvironmentValues {
    /// Максимальная доступная высата для шторки
    var bottomSheetMaxHeight: CGFloat {
        get { self[BottomSheetMaxHeightKey.self] }
        set { self[BottomSheetMaxHeightKey.self] = newValue }
    }
}

private struct BottomSheetMaxHeightKey: EnvironmentKey {
    static let defaultValue: CGFloat = 0
}

// MARK: - ContentSizeMode

public enum ContentSizeMode {
    /// Статичный размер на момент вызова onAppear
    case `static`
    /// Динамичный размер
    case dynamic
}

public extension View {
    /// Возвращает размер контента view на момент отображения.
    /// - Parameters:
    ///   - mode: мод получения размера контента. По умолчанию: .static.
    ///   - contentSize: клоужер с размерами контента в зависимости от мода.
    @ViewBuilder
    func contentSize(_ mode: ContentSizeMode = .static, contentSize: @escaping (CGSize) -> Void) -> some View {
        switch mode {
        case .static:
            modifier(StaticContentSizeModifier(contentSize: contentSize))
        case .dynamic:
            modifier(DynamicContentSizeModifier(contentSize: contentSize))
        }
    }
}




// MARK: - StaticContentSizeModifier

private struct StaticContentSizeModifier: ViewModifier {
    // MARK: - Properties

    let contentSize: (CGSize) -> Void

    // MARK: - Content

    func body(content: Content) -> some View {
        content
            .background {
                GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            contentSize(proxy.size)
                        }
                }
            }
    }
}

// MARK: - DynamicContentSizeModifier

private struct DynamicContentSizeModifier: ViewModifier {
    // MARK: - Properties

    let contentSize: (CGSize) -> Void

    // MARK: - Content

    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geometryProxy in
                    Color.clear
                        .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
                }
            )
            .onPreferenceChange(SizePreferenceKey.self, perform: contentSize)
    }
}

// MARK: - SizePreferenceKey

private struct SizePreferenceKey: PreferenceKey {
    // MARK: - Static Properties

    static var defaultValue: CGSize = .zero

    // MARK: - Static Functions

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
