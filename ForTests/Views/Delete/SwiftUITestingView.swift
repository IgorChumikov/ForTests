//
//  FavoritesDocUnderControlAnnotationView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 04.03.2025.
//

import SwiftUI

struct FavoritesDocUnderControlAnnotationView: View {
    
    let text: String
    @State private var isExpanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(text)
                .lineSpacing(3)
                .lineLimit(isExpanded ? nil : 4) // Обрезаем текст, если не развернуто
                .animation(.easeInOut, value: isExpanded) // Анимируем изменение lineLimit

            expandButton
                .opacity(isExpanded ? 0 : 1) // Скрываем кнопку плавно
                .animation(.easeInOut, value: isExpanded)
        }
    }
    
    private var expandButton: some View {
        Button {
            withAnimation {
                isExpanded.toggle()
            }
        } label: {
            HStack(alignment: .center, spacing: 4) {
                Image(systemName: isExpanded ? "arrow.up" : "arrow.down")
                Text(isExpanded ? "Свернуть" : "Развернуть")
            }
            .foregroundColor(.blue)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    FavoritesDocUnderControlAnnotationView(
        text: "Дополнены положения о личном фонде. Уточнены нормы о ликвидации общественно полезного фонда в случае осуществления деятельности, противоречащей уставным целям. Дополнены положения о личном фонде. Уточнены нормы о ликвидации общественно полезного фонда в случае осуществления деятельности, противоречащей уставным целям."
    )
}
