//
//  PanelViewIndicator.swift
//  ForTests
//
//  Created by Игорь Чумиков on 14.05.2024.
//

import SwiftUI

private extension CGFloat {
    static let indicatorHeight: CGFloat = 4
    static let indicatorWidth: CGFloat = 38
}

// MARK: - PanelViewIndicator

public struct PanelViewIndicator: View {
    // MARK: - Init

    public init() {}

    // MARK: - Content

    public var body: some View {
        RoundedRectangle(cornerRadius: .indicatorHeight / 2.0)
            .fill(Color(.red))
            .frame(width: .indicatorWidth, height: .indicatorHeight)
    }
}

// MARK: - PanelViewIndicator_Previews

struct PanelViewIndicator_Previews: PreviewProvider {
    static var previews: some View {
        PanelViewIndicator()
    }
}
