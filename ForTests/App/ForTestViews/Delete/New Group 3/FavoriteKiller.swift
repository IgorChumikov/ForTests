//
//  FavoriteKiller.swift
//  ForTests
//
//  Created by Игорь Чумиков on 20.03.2025.
//

import SwiftUI

struct FavoriteKiller: View {
    @State private var trackingOption: TrackingOption = .fragment
    
    enum TrackingOption {
        case fragment
        case wholeDocument
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Какие изменения в тексте документа отслеживать?")
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 8) {
                ControlDocsRadioButtonView(text: "Только в этом фрагменте", isSelected: trackingOption == .fragment) {
                    trackingOption = .fragment
                }
                
                if trackingOption == .fragment {
                    Text("Статья 1234. Государственная регистрация результатов интеллектуальной деятельности разработчиков КонсультантПлюс")
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
            }
            
            ControlDocsRadioButtonView(text: "Во всем документе", isSelected: trackingOption == .wholeDocument) {
                trackingOption = .wholeDocument
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ControlDocsRadioButtonView: View {
    var text: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(isSelected ? .purple : .gray)
                
                Text(text)
                    .foregroundColor(.primary)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    FavoriteKiller()
}
