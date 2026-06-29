//
//  KeyboardHelper.swift
//  ForTests
//
//  Created by Игорь Чумиков on 14.05.2024.
//

import SwiftUI
import UIKit
import Combine

// MARK: - KeyboardHelper

public final class KeyboardHelper: ObservableObject  {
    // MARK: - Nested Types

    public enum State: Hashable {
        /// скрыта
        case hidden
        /// скрывается
        case hidding
        /// показывается
        case showing
        /// показана
        case shown
    }

    // MARK: - Properties

    /// Высота клавиатуры
    @Published
    public var keyboardHeight: CGFloat = 0

    /// Текущее состояние клавиатуры
    @Published
    public var keyboardStatus: State = .hidden

    /// Продолжительность анимации клавиатуры
    @Published
    public var animationDuration: CGFloat = 0

    /// Кривая анимации клавиатуры
    @Published
    public var animationCurve: UIView.AnimationCurve = .linear

    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Computed Properties

    public var keyboardIsVisible: Bool {
        keyboardStatus == .showing || keyboardStatus == .shown
    }

    // MARK: - Init

    public init() {
        subscribe()
    }

    // MARK: - Functions

    private func subscribe() {
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .sink { [weak self] notification in
                self?.handleKeyboardWillShow(notification)
            }
            .store(in: &subscriptions)

        NotificationCenter.default.publisher(for: UIResponder.keyboardDidShowNotification)
            .sink { [weak self] notification in
                self?.handleKeyboardDidShow(notification)
            }
            .store(in: &subscriptions)

        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .sink { [weak self] notification in
                self?.handleKeyboardWillHide(notification)
            }
            .store(in: &subscriptions)

        NotificationCenter.default.publisher(for: UIResponder.keyboardDidHideNotification)
            .sink { [weak self] notification in
                self?.handleKeyboardDidHide(notification)
            }
            .store(in: &subscriptions)
    }

    private func handleKeyboardWillShow(_ notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let keyboardEndFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
            let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? CGFloat,
            let animationCurveRawValue = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int else { return }

        keyboardHeight = keyboardEndFrame.height
        self.animationDuration = animationDuration
        animationCurve = UIView.AnimationCurve(rawValue: animationCurveRawValue) ?? .linear
        keyboardStatus = .showing
    }

    private func handleKeyboardDidShow(_ notification: Notification) {
        keyboardStatus = .shown
    }

    private func handleKeyboardWillHide(_ notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? CGFloat,
            let animationCurveRawValue = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int else { return }

        keyboardHeight = 0
        self.animationDuration = animationDuration
        animationCurve = UIView.AnimationCurve(rawValue: animationCurveRawValue) ?? .linear
        keyboardStatus = .hidding
    }

    private func handleKeyboardDidHide(_ notification: Notification) {
        keyboardStatus = .hidden
    }
}
