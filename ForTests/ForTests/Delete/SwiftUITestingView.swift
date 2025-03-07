//
//  SwiftUITestingView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 04.03.2025.
//

import SwiftUI

struct SwiftUITestingView: View {
    
    let text: String
    @State private var isExpanded: Bool = false
    @State private var textHeight: CGFloat = .zero
    @State private var lineLimit: Int? = 4
    
    var body: some View {
        annotation
    }
    
    private var annotation: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(text)
                .lineSpacing(3)
                .lineLimit(isExpanded ? nil : lineLimit) // Обрезаем до 4 строк, если не развернуто
                .background(GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            textHeight = proxy.size.height
                        }
                })

            expandButton
                .hidden(isExpanded, mode: .removed) // Скрываем кнопку, если текст развернут
        }
    }
    
    private var expandButton: some View {
        Button {
            withAnimation {
                isExpanded.toggle() // Меняем состояние
            }
        } label: {
            HStack(alignment: .center, spacing: 4) {
                Image(systemName: "arrow.down")
                Text("Развернуть")
            }
            .foregroundColor(.blue)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    SwiftUITestingView(
        text: "Дополнены положения о личном фонде. Уточнены нормы о ликвидации общественно полезного фонда в случае осуществления деятельности, противоречающией уставным целям. Дополнены положения о личном фонде. Уточнены нормы о ликвидации общественно полезного фонда в случае осуществления деятельности, противоречающией уставным целям."
    )
}
