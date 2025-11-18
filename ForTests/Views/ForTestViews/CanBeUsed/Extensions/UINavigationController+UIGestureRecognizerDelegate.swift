//
//  UINavigationController+UIGestureRecognizerDelegate.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.03.2024.
//

import UIKit

private enum NavGestureConstants {
    static let minimumViewControllerCount = 1
}

// Add the ability to tap with a finger to go back to the previous screen throughout the application
// if the number of controllers in the stack is greater than the specified minimum number (in this case, 1)

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > NavGestureConstants.minimumViewControllerCount
    }
}
