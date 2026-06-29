//
//  ScrollDirectionView.swift
//

import SwiftUI

// MARK: - Constants

private enum ScrollDirectionConstants {
    static let scrollingRation: CGFloat = 5
    static let scrollingThreshold: CGFloat = 60
}

// MARK: - ScrollDirectionView

/// `ScrollDirectionView` - это view, которая предоставляет направление прокрутки, за счёт UIKit ового Velocity.
///
/// - Parameters:
///   - Content: Тип представления содержимого.
public struct ScrollDirectionView<Content>: View where Content: View {
    // MARK: - Properties

    private let content: Content

    /// Признак направления прокрутки вверх
    @Binding private var isScrollingUp: Bool

    // MARK: - Init

    /// Инициализирует `ScrollDirectionView` с указанными параметрами.
    ///
    /// - Parameters:
    ///   - isScrollingUp: Направление скролла
    ///   - content: Замыкание, возвращающее представление содержимого
    public init(
        isScrollingUp: Binding<Bool>,
        @ViewBuilder content: () -> Content
    ) {
        _isScrollingUp = isScrollingUp
        self.content = content()
    }

    // MARK: - Content

    public var body: some View {
        ScrollView(showsIndicators: false) {
            content
                .background {
                    ScrollDirectionCustomGesture {
                        handle(gesture: $0)
                    }
                }
        }
    }

    // MARK: - Functions

    func handle(gesture: UIPanGestureRecognizer) {
        let velocityY = gesture.velocity(in: gesture.view).y
        let scrollingRation = velocityY / ScrollDirectionConstants.scrollingRation

        if velocityY < .zero {
            if -scrollingRation > ScrollDirectionConstants.scrollingThreshold, isScrollingUp {
                isScrollingUp = false
            }
        } else {
            if scrollingRation > ScrollDirectionConstants.scrollingThreshold, !isScrollingUp {
                isScrollingUp = true
            }
        }
    }
}
