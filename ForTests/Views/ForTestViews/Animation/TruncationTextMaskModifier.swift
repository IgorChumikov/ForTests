//
//  TruncationTextMaskModifier.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.03.2025.
//

import SwiftUI

// MARK: - TruncationTextMaskModifier

private struct TruncationTextMaskModifier: ViewModifier {
    // MARK: - Properties

    let size: CGSize
    let enabled: Bool

    @Environment(\.layoutDirection) private var layoutDirection

    // MARK: - Content

    func body(content: Content) -> some View {
        if enabled {
            content
                .mask(
                    VStack.zeroSpacing {
                        Rectangle()
                        HStack.zeroSpacing {
                            Rectangle()
                            HStack.zeroSpacing {
                                LinearGradient(
                                    gradient: Gradient(stops: [
                                        Gradient.Stop(color: .black, location: 0),
                                        Gradient.Stop(color: .clear, location: 0.9),
                                    ]),
                                    startPoint: layoutDirection == .rightToLeft ? .trailing : .leading,
                                    endPoint: layoutDirection == .rightToLeft ? .leading : .trailing
                                )
                                .frame(width: size.width, height: size.height)

                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: size.width)
                            }
                        }
                        .frame(height: size.height)
                    }
                )
        } else {
            content
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

extension View {
    func applyingTruncationMask(size: CGSize, enabled: Bool) -> some View {
        modifier(TruncationTextMaskModifier(size: size, enabled: enabled))
    }
}

extension VStack {
    static func zeroSpacing(@ViewBuilder content: () -> Content) -> some View {
        VStack(spacing: 0, content: content)
    }
}

extension HStack {
    static func zeroSpacing(@ViewBuilder content: () -> Content) -> some View {
        HStack(spacing: 0, content: content)
    }
}
