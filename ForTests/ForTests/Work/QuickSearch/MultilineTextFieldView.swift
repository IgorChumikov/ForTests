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
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
       @Environment(\.verticalSizeClass) private var verticalSizeClass
       
       private var cp_regularRegular: Bool {
           return horizontalSizeClass == .regular && verticalSizeClass == .regular
       }
    
    private var maximumHeight: CGFloat  {
          cp_regularRegular ? 104 : 108
      }
      private var minActiveHeight: CGFloat {
          cp_regularRegular ? 64 : 56
      }
      private var verticalBorderHeight: CGFloat {
          cp_regularRegular ? 20 : 16
      }
    private let navigationViewHeight: CGFloat = 44
    private let leftDistance: CGFloat = 32
    
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
        .padding(.vertical, verticalBorderHeight / 2)
        .onAppear {
            adjustTextViewHeight()
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
        // Создание текстового редактора с привязкой к текстовому свойству viewModel
        TextEditor(text: $viewModel.textViewText)
            .focused($isTextEditorFocused)
            // Установка высоты текстового редактора в зависимости от значения searchFieldHeight и maxTextViewHeight
            .frame(height: min(maximumHeight, searchFieldHeight))
            // Горизонтальные отступы (слева и справа)
            .padding(.horizontal, 20)
            .padding(.top, 15)
            // Наложение для отображения placeholder текста
            .overlay(
                // Текст для placeholder, если viewModel.placeholderAttributedText пуст, то отображается пустая строка
                Text(viewModel.placeholderAttributedText?.string ?? "Поиск по документу")
                    .offset(x: 9, y: 24)
                    // Установка серого цвета для placeholder текста
                    .foregroundColor(.gray)
                    // Горизонтальные отступы для placeholder текста
                    .padding(.horizontal, leftDistance / 2)
                    // Установка прозрачности: 1, если текстовое поле пустое, иначе 0
                    .opacity(viewModel.textViewText.isEmpty ? 1 : 0),
                // Выравнивание placeholder в верхний левый угол
                alignment: .topLeading
            )
            // Установка фона текстового редактора
            .background(Color(.secondarySystemBackground))
            // Закругление углов текстового редактора
            .cornerRadius(8)
            // Дополнительные горизонтальные отступы
           // .padding(.horizontal, leftDistance / 2)
            // Обработка изменений в текстовом поле
            .onChange(of: viewModel.textViewText) { _ in
                adjustTextViewHeight() // Вызов функции для корректировки высоты текстового редактора
            }
            // Обработка касания по текстовому редактору
            .onTapGesture {
                isEditing = true // Установка флага isEditing в true при нажатии на текстовый редактор
            }
    }
    
    // MARK: - Private functions

    private func adjustTextViewHeight() {
        // Устанавливаем фиксированную ширину, вычитая от ширины экрана значение leftDistance
        let fixedWidth = UIScreen.main.bounds.width - leftDistance
        
        // Рассчитываем новый размер текстового поля на основе его текущего текста
        let newSize = viewModel.textViewText.boundingRect(
            with: CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude), // Задаем максимально возможную высоту
            options: .usesLineFragmentOrigin, // Указываем, что должны быть учтены все разрывы строк и фрагменты
            attributes: [.font: UIFont.systemFont(ofSize: UIFont.systemFontSize)], // Указываем атрибуты текста, включая шрифт
            context: nil // Не используем контекст
        ).size
        
        // Устанавливаем высоту текстового поля, ограничивая её минимальным и максимальным значениями
        searchFieldHeight = min(maximumHeight, max(minActiveHeight, newSize.height + verticalBorderHeight))
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

#Preview {
    MultilineSearchField()
}


import SwiftUI

struct SizeClassKey: EnvironmentKey {
    static let defaultValue: UITraitCollection = UITraitCollection(horizontalSizeClass: .compact)
}

extension EnvironmentValues {
    var sizeClass: UITraitCollection {
        get { self[SizeClassKey.self] }
        set { self[SizeClassKey.self] = newValue }
    }
}

extension View {
    func sizeClass(_ sizeClass: UITraitCollection) -> some View {
        environment(\.sizeClass, sizeClass)
    }
}
