//
//  HelperSwiftUIView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 20.11.2024.
//

import SwiftUI

struct HelperSwiftUIView: View {
    var body: some View {
        let correctedText = CorrectedText(
            corrected: "Совета",
            initial: "Рокета",
            replacements: [
                .bold: [NSRange(location: 0, length: 6)],
                .color: [NSRange(location: 0, length: 1), NSRange(location: 2, length: 1)]
            ]
        )
        
        VStack {
            CorrectedTextView(correctedText: correctedText)
                .padding()
        }
        .background(Color(white: 0.9))
        .ignoresSafeArea()
    }
}


#Preview {
    HelperSwiftUIView()
}


import SwiftUI

struct CorrectedText {
    let corrected: String
    let initial: String
    let replacements: [SyntaxReplacementStyle: [NSRange]]
}

enum SyntaxReplacementStyle {
    case bold
    case color
}

struct CorrectedTextView: View {
    let correctedText: CorrectedText
    
    var body: some View {
        HStack {
            Text("Исправлена опечатка ")
                .font(.system(size: 14))
                .foregroundColor(.black)
            
            AttributedTextView(attributedString: createAttributedString())
            
            Spacer()
            
            Button("Отменить") {
                // Действие при нажатии
            }
            .font(.system(size: 14))
            .foregroundColor(.black)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
        .padding()
        .background(Color(red: 0.95, green: 0.95, blue: 1)) // Светло-голубой фон
        .cornerRadius(10)
    }
    
    private func createAttributedString() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: "«\(correctedText.initial)»")
        
        // Apply bold
        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14, weight: .semibold)
        ]
        for range in correctedText.replacements[.bold] ?? [] {
            attributedString.addAttributes(boldAttributes, range: range)
        }
        
        // Apply color
        let colorAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.red
        ]
        for range in correctedText.replacements[.color] ?? [] {
            attributedString.addAttributes(colorAttributes, range: range)
        }
        
        return attributedString
    }
}

struct AttributedTextView: UIViewRepresentable {
    let attributedString: NSAttributedString
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.attributedText = attributedString
    }
}
