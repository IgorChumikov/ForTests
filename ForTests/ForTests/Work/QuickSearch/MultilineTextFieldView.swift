//
//  MultilineTextFieldView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 28.05.2024.
//

import SwiftUI
import Combine

class MultilineSearchFieldViewModel: ObservableObject {
    @Published var placeholderAttributedText: NSAttributedString?
    @Published var textViewText: String = ""
    @Published var navigationBarText: String = ""
    @Published var searchButtonStyle: SearchButtonStyle = .search
    @Published var searchText: String = ""

    var clearButtonAccessibility: String = "Clear"
    var closeButtonAccessibility: String = "Close"

    enum SearchButtonStyle {
        case search
        case editing

        var params: (text: String, backgroundColor: Color, textColor: Color) {
            switch self {
            case .search:
                return ("Search", .blue, .white)
            case .editing:
                return ("Editing", .green, .white)
            }
        }
    }
}

struct MultilineSearchField: View {
    @ObservedObject var viewModel = MultilineSearchFieldViewModel()
    @State private var searchFieldHeight: CGFloat = 0
    @State private var isEditing: Bool = false

    private let verticalBorderHeight: CGFloat = 20
    private let maxTextViewHeight: CGFloat = 104
    private let minActiveHeight: CGFloat = 56
    private let navigationViewHeight: CGFloat = 44
    private let leftDistance: CGFloat = 32

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {
                    clearText()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .accessibilityLabel(viewModel.clearButtonAccessibility)
                }
                .hidden(viewModel.textViewText.isEmpty, mode: .removed)

                Spacer()

                Text(viewModel.navigationBarText)
                    .font(.headline)

                Spacer()

                Button(action: {
                    search()
                }) {
                    Text(viewModel.searchButtonStyle.params.text)
                        .padding()
                        .background(viewModel.searchButtonStyle.params.backgroundColor)
                        .foregroundColor(viewModel.searchButtonStyle.params.textColor)
                        .cornerRadius(5)
                }

                Button(action: {
                    close()
                }) {
                    Image(systemName: "xmark")
                        .accessibilityLabel(viewModel.closeButtonAccessibility)
                }
            }
            .frame(height: navigationViewHeight)
            .padding(.horizontal, leftDistance / 2)

            TextEditor(text: $viewModel.textViewText)
                .frame(height: min(maxTextViewHeight, searchFieldHeight))
                .padding(.horizontal, leftDistance / 2)
                .overlay(
                    Text(viewModel.placeholderAttributedText?.string ?? "")
                        .foregroundColor(.gray)
                        .padding(.horizontal, leftDistance / 2)
                        .opacity(viewModel.textViewText.isEmpty ? 1 : 0),
                    alignment: .topLeading
                )
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .padding(.horizontal, leftDistance / 2)
                .onChange(of: viewModel.textViewText) { _ in
                    adjustTextViewHeight()
                }
                .onTapGesture {
                    isEditing = true
                }
        }
        .padding(.vertical, verticalBorderHeight / 2)
        .onAppear {
            adjustTextViewHeight()
        }
    }

    private func adjustTextViewHeight() {
        let fixedWidth = UIScreen.main.bounds.width - leftDistance
        let newSize = viewModel.textViewText.boundingRect(
            with: CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [.font: UIFont.systemFont(ofSize: UIFont.systemFontSize)],
            context: nil
        ).size

        searchFieldHeight = min(maxTextViewHeight, max(minActiveHeight, newSize.height + verticalBorderHeight))
    }

    private func clearText() {
        viewModel.textViewText = ""
    }

    private func search() {
        let text = viewModel.textViewText.trimmingCharacters(in: .whitespacesAndNewlines)
        if !text.isEmpty {
            viewModel.searchText = text
            isEditing = false
        }
    }

    private func close() {
        isEditing = false
        viewModel.textViewText = ""
    }
}

struct MultilineSearchField_Previews: PreviewProvider {
    static var previews: some View {
        MultilineSearchField()
    }
}


#Preview {
    MultilineSearchField()
}
