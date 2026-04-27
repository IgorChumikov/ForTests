//
//  YourFirstConversation.swift
//  ForTests
//
//  Created by Игорь Чумиков on 27.04.2026.
//

import SwiftUI
import FoundationModels

@available(iOS 26.0, *)
struct YourFirstConversation: View {
    
    @State private var inputText = "Напиши стих про кота"
    @State private var outputText = ""
    @State private var isLoading = false
    
    // 💡 держим сессию, чтобы не пересоздавать каждый раз
    private let session = LanguageModelSession()
    
    var body: some View {
        VStack(spacing: 16) {
            
            TextField("Введите запрос", text: $inputText)
                .textFieldStyle(.roundedBorder)
            
            Button("Сгенерировать") {
                Task {
                    await generateResponse()
                }
            }
            
            if isLoading {
                ProgressView()
            }
            
            ScrollView {
                Text(outputText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
    }
    
    // 🔥 вся логика тут
    private func generateResponse() async {
        isLoading = true
        
        do {
            let result = try await session.respond(to: inputText)
            
            // 📦 достаём текст ответа
            outputText = result.content
            
        } catch {
            outputText = "Ошибка: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}

@available(iOS 26.0, *)
#Preview {
    YourFirstConversation()
}
