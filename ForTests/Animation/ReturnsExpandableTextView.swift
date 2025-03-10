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
    
    var lineLimit: Int = 4
    var moreButtonText: String = "Botton"
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
        VStack(alignment: .leading, spacing: 4) {
            content
                .lineLimit(isExpanded ? nil : lineLimit)
                .applyingTruncationMask(size: moreTextSize, enabled: shouldShowMoreButton)
                .contentSize { size in
                    truncatedSize = size
                    isTruncated = truncatedSize != intrinsicSize
                }
                .background(
                    content
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .hidden()
                        .contentSize { size in
                            intrinsicSize = size
                            isTruncated = truncatedSize != intrinsicSize
                        }
                )
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
    ReturnsExpandableTextView("Консульта́нтПлю́с — кроссплатформенная справочная правовая система, разработанная в России. Первоначально разработку системы осуществляло Научно-производственное объединение «Вычислительная математика и информатика» (НПО «ВМИ»), отвечавшая за разработку системы «Гарант (справочно-правовая система)». Первая версия системы была выпущена в 1992 году[3].На официальном сайте разработчик предоставляет возможность работы с некоммерческой интернет-версией — сокращенной версией")
        .padding()
}
