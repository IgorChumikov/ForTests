//
//  DynamicHeightTextEditor.swift
//  ForTests
//
//  Created by Игорь Чумиков on 29.05.2024.
//

import SwiftUI

struct DynamicHeightTextEditor: View {
    @State private var text: String = ""
    @State private var textHeight: CGFloat = 50
    private let maxHeight: CGFloat = 104
    
    var body: some View {
        VStack {
            TextEditor(text: $text)
                .frame(height: min(textHeight, maxHeight))
                .background(GeometryReader { geometry in
                    Color.clear.onAppear {
                        // Изначально устанавливаем высоту на основе текущего текста
                        self.textHeight = calculateHeight(for: text, width: geometry.size.width)
                    }
                })
                .onChange(of: text) { newValue in
                    // Пересчитываем высоту при изменении текста
                    withAnimation {
                        self.textHeight = min(calculateHeight(for: newValue, width: UIScreen.main.bounds.width - 32), maxHeight)
                        // 32 это отступ .padding()
                    }
                }
                .padding()
                .border(Color.gray)
        }
        .padding()
    }
    
    private func calculateHeight(for text: String, width: CGFloat) -> CGFloat {
        let textView = UITextView()
        textView.text = text
        textView.font = UIFont.systemFont(ofSize: 17)
        let size = textView.sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
        return size.height
    }
}

#Preview {
    DynamicHeightTextEditor()
}
