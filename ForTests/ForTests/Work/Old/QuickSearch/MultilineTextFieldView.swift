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
    
    @State private var isEditing: Bool = false
    
    @State private var textHeight: CGFloat = 50
    private let maxHeight: CGFloat = 104
    
    @FocusState private var isTextEditorFocused: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center, spacing: .zero) {
                textEditor
                textClearButton
                    .hidden(viewModel.textViewText.isEmpty, mode: .removed)
                textSearchButton
            }
        }
        .onAppear {
            isTextEditorFocused = true
        }
    }
    
    // MARK: - Private view
    
    private var textClearButton: some View {
        Button(action: {
            clearText()
        }) {
            Image(systemName: "xmark.circle.fill")
                .accessibilityLabel(viewModel.clearButtonAccessibility)
        }
    }
    
    private var textSearchButton: some View {
        Button(action: {
            search()
        }) {
            Text(viewModel.searchButtonStyle.params.text)
                .padding()
                .background(viewModel.searchButtonStyle.params.backgroundColor)
                .foregroundColor(viewModel.searchButtonStyle.params.textColor)
                .cornerRadius(5)
        }
    }
    
    private var textEditor: some View {
        TextEditor(text: $viewModel.textViewText)
            .focused($isTextEditorFocused)
            .frame(height: min(textHeight, maxHeight))
            .background(GeometryReader { geometry in
                Color.clear.onAppear {
                    // Изначально устанавливаем высоту на основе текущего текста
                    self.textHeight = calculateHeight(for: viewModel.textViewText, width: geometry.size.width)
                }
            })
            .onChange(of: viewModel.textViewText) { newValue in
                // Пересчитываем высоту при изменении текста
                withAnimation {
                    self.textHeight = min(calculateHeight(for: newValue, width: UIScreen.main.bounds.width - 0), maxHeight)
                    // 32 это отступ .padding()
                }
            }
            .padding(.horizontal, 1)
            .padding(.top, 1)
            .padding(.bottom, 1)
            .background(Color(.red))
        
            // Наложение для отображения placeholder текста
            .overlay(
                Text(viewModel.placeholderAttributedText?.string ?? "Поиск по документу")
                    .offset(x: -10, y: 10)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 32 / 2)
                    .opacity(viewModel.textViewText.isEmpty ? 1 : 0),
                alignment: .topLeading
            )
            .onTapGesture {
                isEditing = true // Установка флага isEditing в true при нажатии на текстовый редактор
            }
    }
    
    // MARK: - Private functions
    
    private func calculateHeight(for text: String, width: CGFloat) -> CGFloat {
        let boundingSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)]

        let rect = NSString(string: text).boundingRect(with: boundingSize, options: options, attributes: attributes, context: nil)

        return ceil(rect.height + 20)
    }

//    private func calculateHeight(for text: String, width: CGFloat) -> CGFloat {
//        let textView = UITextView()
//        textView.text = text
//        textView.font = UIFont.systemFont(ofSize: 17)
//        let size = textView.sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
//        return size.height
//    }

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

#Preview {
    MultilineSearchField()
}
