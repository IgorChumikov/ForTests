//
//  ExpandableText.swift
//  ForTests
//
//  Created by Игорь Чумиков on 25.07.2025.
//

import SwiftUI

struct Content111View111: View {
    let longText = """
    Это длинный текст, который демонстрирует работу ExpandableText.\
    Он автоматически разворачивается по кнопке, если обрезан.\
        Тут ещё несколько строк.  Тут ещё несколько строк.  Тут ещё несколько строк.  Тут ещё несколько строк.  Тут ещё несколько строк.  Тут ещё несколько строк.  Тут ещё несколько строк.  Тут ещё несколько строк.  Тут ещё несколько строк.  Тут ещё несколько строк.  Тут ещё несколько строк.  Тут ещё несколько строк.  Тут ещё несколько строк.  Тут ещё несколько строк.  Тут ещё несколько строк.  Тут ещё несколько строк.  Тут ещё несколько строк.  Тут ещё несколько строк.  Тут ещё несколько строк.  Тут ещё несколько строк.  Тут ещё несколько строк.  Тут ещё несколько строк.
    Тут ещё несколько строк.
    """

    var body: some View {
        ScrollView {
            ExpandableText(longText)
                .padding()
        }
    }
}


#Preview {
    Content111View111()
}



import SwiftUI

// MARK: - ExpandableText

public struct ExpandableText: View {
    private let text: String
    private var lineLimit: Int = 3
    private var moreButtonText: String = "Развернуть"
    private var collapseText: String = "Свернуть"
    
    public init(_ text: String) {
        self.text = text.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    // MARK: - State

    @State private var isExpanded = false
    @State private var isTruncated = false
    @State private var intrinsicSize: CGSize = .zero
    @State private var truncatedSize: CGSize = .zero
    @State private var moreTextSize: CGSize = .zero

    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(.init(displayedText))
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(isExpanded ? nil : lineLimit)
                .applyingTruncationMask(size: moreTextSize, enabled: !isExpanded && isTruncated)
                .background(
                    Text(.init(displayedText))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .hidden()
                        .readSize { size in
                            intrinsicSize = size
                            isTruncated = truncatedSize != intrinsicSize
                        }
                )
                .readSize { size in
                    truncatedSize = size
                    isTruncated = truncatedSize != intrinsicSize
                }
                .overlay(alignment: .trailingLastTextBaseline) {
                    if !isExpanded && isTruncated {
                        Button {
                            withAnimation {
                                isExpanded.toggle()
                            }
                        } label: {
                            Text(moreButtonText)
                                .font(.body)
                        }
                        .background(
                            Text(moreButtonText)
                                .hidden()
                                .readSize { moreTextSize = $0 }
                        )
                    }
                }
            
            if isExpanded && isTruncated {
                Button(collapseText) {
                    withAnimation {
                        isExpanded = false
                    }
                }
                .font(.body)
            }
        }
    }

    private var displayedText: String {
        (!isExpanded && isTruncated) ? textTrimmingDoubleNewlines : text
    }

    private var textTrimmingDoubleNewlines: String {
        text.replacingOccurrences(of: #"\n\s*\n"#, with: "\n", options: .regularExpression)
    }
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}


private struct TruncationTextMask: ViewModifier {
    let size: CGSize
    let enabled: Bool

    @Environment(\.layoutDirection) private var layoutDirection

    func body(content: Content) -> some View {
        if enabled {
            content
                .mask(
                    VStack(spacing: 0) {
                        Rectangle()
                        HStack(spacing: 0) {
                            Rectangle()
                            HStack(spacing: 0) {
                                LinearGradient(
                                    gradient: Gradient(stops: [
                                        .init(color: .black, location: 0),
                                        .init(color: .clear, location: 0.9)
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
        }
    }
}

