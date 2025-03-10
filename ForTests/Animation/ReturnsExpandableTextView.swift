//
//  ReturnsExpandableTextView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.03.2025.
//

import SwiftUI

// MARK: - ExpandableText

/// Компонент с кнопкой раскрытия текста
struct ReturnsExpandableTextView: View {
    // MARK: - Properties
    
    var lineLimit: Int = 2
    var moreButtonText: String = "Strings.Returns.returnsRowItemExpandButtonTitle"
    var expandAnimation: Animation = .default
    var collapseEnabled: Bool = false
    var trimMultipleNewlinesWhenTruncated: Bool = true
    
    @State private var isExpanded: Bool = false
    @State private var isTruncated: Bool = false
    
    @State private var intrinsicSize: CGSize = .zero
    @State private var truncatedSize: CGSize = .zero
    @State private var moreTextSize: CGSize = .zero
    
    private let text: String
    
    // MARK: - Computed Properties
    
    private var shouldShowMoreButton: Bool {
        !isExpanded && isTruncated
    }
    
    private var textTrimmingDoubleNewlines: String {
        text.replacingOccurrences(of: #"\n\s*\n"#, with: "\n", options: .regularExpression)
    }
    
    // MARK: - Init
    
    public init(_ text: String) {
        self.text = text.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    // MARK: - Content
    
    public var body: some View {
        content
            .lineLimit(isExpanded ? nil : lineLimit)
            .applyingTruncationMask(size: moreTextSize, enabled: shouldShowMoreButton)
            .readSize { size in
                truncatedSize = size
                isTruncated = truncatedSize != intrinsicSize
            }
            .background(
                content
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .hidden()
                    .readSize { size in
                        intrinsicSize = size
                        isTruncated = truncatedSize != intrinsicSize
                    }
            )
            .background(
                Text(moreButtonText)
                    .hidden()
                    .readSize { moreTextSize = $0 }
            )
            .contentShape(Rectangle())
            .onTapGesture {
                if (isExpanded && collapseEnabled) ||
                    shouldShowMoreButton {
                    withAnimation(expandAnimation) { isExpanded.toggle() }
                }
            }
            .overlay(alignment: .trailingLastTextBaseline) {
                moreTextButton
            }
    }
    
    /// Основной контент
    private var content: some View {
        Text(.init(
            trimMultipleNewlinesWhenTruncated
            ? (shouldShowMoreButton ? textTrimmingDoubleNewlines : text)
            : text
        ))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    /// Кнопка раскрытия текста
    @ViewBuilder private var moreTextButton: some View {
        if shouldShowMoreButton {
            Button {
                withAnimation(expandAnimation) { isExpanded.toggle() }
            } label: {
                Text(moreButtonText)
            }
        }
    }
}


#Preview {
    ReturnsExpandableTextView()
}
