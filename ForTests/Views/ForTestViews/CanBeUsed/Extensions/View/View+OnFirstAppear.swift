//
//  View+OnFirstAppear.swift
//  ForTests
//
//  Created by Игорь Чумиков on 19.02.2024.
//

import SwiftUI

public extension View {
    /// Добавляет экшен, который вызывается при первом вызове onAppear модификатора.
    @inlinable
    func onFirstAppear(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewOnFirstAppearModifier(perform: action))
    }
}

// MARK: - ViewOnFirstAppearModifier

@usableFromInline
struct ViewOnFirstAppearModifier: ViewModifier {
    // MARK: - Properties

    @State
    private var didFirstAppear = false
    private let action: (() -> Void)?

    // MARK: - Init

    @usableFromInline
    init(perform action: (() -> Void)? = nil) {
        self.action = action
    }

    // MARK: - Content

    @usableFromInline
    func body(content: Content) -> some View {
        content.onAppear {
            if didFirstAppear == false {
                didFirstAppear = true
                action?()
            }
        }
    }
}

