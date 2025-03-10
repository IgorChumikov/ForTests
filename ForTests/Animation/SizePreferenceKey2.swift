//
//  SizePreferenceKey2.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.03.2025.
//

import SwiftUI

// MARK: - SizePreferenceKey

private struct SizePreferenceKey2: PreferenceKey {
    // MARK: - Static Properties

    static var defaultValue: CGSize = .zero

    // MARK: - Static Functions

    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey2.self, value: geometryProxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey2.self, perform: onChange)
    }
}

