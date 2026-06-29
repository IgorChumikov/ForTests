//
//  ScrollDirectionCustomGesture.swift
//

import SwiftUI

// MARK: - Constants

private enum ScrollDirectionCustomGestureConstants {
    static let scrollDirectionCustomGesture = "scrollDirectionCustomGesture"
}

// MARK: - ScrollDirectionCustomGesture

struct ScrollDirectionCustomGesture: UIViewRepresentable {
    // MARK: - Nested Types

    typealias GestureHandler = (UIPanGestureRecognizer) -> Void

    class Coordinator: NSObject, UIGestureRecognizerDelegate {
        // MARK: - Properties

        var onChange: GestureHandler

        // MARK: - Init

        init(onChange: @escaping GestureHandler) {
            self.onChange = onChange
        }

        // MARK: - Functions

        @objc
        func gestureChange(gesture: UIPanGestureRecognizer) {
            onChange(gesture)
        }

        func gestureRecognizer(
            _ gestureRecognizer: UIGestureRecognizer,
            shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
        ) -> Bool {
            true
        }
    }

    // MARK: - Properties

    var onChange: GestureHandler

    // MARK: - Functions

    func makeCoordinator() -> Coordinator {
        Coordinator(onChange: onChange)
    }

    func makeUIView(context: Context) -> some UIView {
        UIView()
    }

    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.async {
            guard
                let superview = uiView.superview?.superview,
                !(superview.gestureRecognizers?.contains(where: { $0.name == ScrollDirectionCustomGestureConstants.scrollDirectionCustomGesture }) ?? false) else { return }

            let gesture = UIPanGestureRecognizer(
                target: context.coordinator,
                action: #selector(context.coordinator.gestureChange(gesture:))
            )

            gesture.name = ScrollDirectionCustomGestureConstants.scrollDirectionCustomGesture
            gesture.delegate = context.coordinator
            superview.addGestureRecognizer(gesture)
        }
    }
}
