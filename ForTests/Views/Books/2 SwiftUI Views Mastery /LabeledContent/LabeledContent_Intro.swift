//
//  LabeledContent_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.10.2025.
//

import SwiftUI

struct LabeledContent_Intro: View {
    var body: some View {
        VStack(spacing: 50) {
            
            // 1️⃣ Примеры использования LabeledContent в обычном VStack
            VStack(spacing: 24) {
                
                // Простая пара "Label – Value"
                LabeledContent("Label", value: "Value")
                
                // С кастомным контентом (например, Label с иконкой)
                LabeledContent("Label") {
                    Label("Value", systemImage: "camera.macro")
                }
                
                // Автоформат значения
                LabeledContent("Label", value: 0.55, format: .percent)
                
                // Полностью кастомный вариант
                LabeledContent {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("With LabeledContent, you provide your own custom Label and content.")
                        Text("It’s really like a template that will get handled just like other controls in different layout situations.")
                            .foregroundColor(.secondary)
                    }
                    
                    Text("Value")
                        .font(.title.weight(.thin))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                } label: {
                    Text("Label")
                        .fontWeight(.bold)
                }
            }
            .padding()
            
            // 2️⃣ Пример LabeledContent в контексте Form
            Form {
                Section("Examples in Form") {
                    // Классический пример в форме
                    LabeledContent("Number") {
                        Text(55, format: .number)
                    }
                    
                    // Альтернатива через badge
                    Text("Text with Badge")
                        .badge(55)
                    
                    Text("""
                    Using the badge modifier provides a similar result,
                    but the problem is you can’t customize how the badge text looks in a Form.
                    """)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .font(.title3)
    }
}

#Preview {
    LabeledContent_Intro()
}
