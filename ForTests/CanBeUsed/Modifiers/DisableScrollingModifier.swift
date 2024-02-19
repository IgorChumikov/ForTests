//
//  DisableScrollingModifier.swift
//  ForTests
//
//  Created by Игорь Чумиков on 19.02.2024.
//

import SwiftUI

// MARK: - DisableScrollingModifier
struct DisableScrollingModifier: ViewModifier {
    // MARK: - Properties
    
    var disabled: Bool
    
    // MARK: - Content
    
    func body(content: Content) -> some View {
        if disabled {
            content
                .simultaneousGesture(DragGesture(minimumDistance: 0))
        } else {
            content
        }
    }
}

// MARK: - Extension

// Прокрутка контента включена или выключена
extension View {
    func scrollingDisabled(_ disabled: Bool) -> some View {
        modifier(DisableScrollingModifier(disabled: disabled))
    }
}
