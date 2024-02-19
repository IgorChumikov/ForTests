//
//  View+Padding.swift
//  ForTests
//
//  Created by Игорь Чумиков on 19.02.2024.
//

import SwiftUI

public extension View {
    @inlinable
    func padding(top: CGFloat = 0, leading: CGFloat = 0, bottom: CGFloat = 0, trailing: CGFloat = 0) -> some View {
        padding(EdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing))
    }
}
