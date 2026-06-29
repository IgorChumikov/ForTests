//
//  11111.swift
//  ForTests
//
//  Created by Игорь Чумиков on 23.05.2025.
//

import SwiftUI

struct DocumentEventDrawer: View {
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Заголовок шторки
            HStack {
                Text("Событие с документом на контроле")
                    .font(.headline)
                
                Spacer()
                
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.systemGray6))
            .onTapGesture {
                withAnimation(.easeInOut) {
                    isExpanded.toggle()
                }
            }
            
            // Контент шторки
            if isExpanded {
                VStack(alignment: .leading, spacing: 12) {
                    Text("1. Вступили в силу изменения, внесенные в документ")
                        .font(.subheadline)
                    
                    HStack(spacing: 16) {
                        // Кнопка с галочкой
                        Button(action: {
                            // Действие для перехода к обзору изменений
                        }) {
                            HStack {
                                Image(systemName: "checkmark")
                                Text("Перейти к обзору изменений")
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                        
                        // Кнопка со стрелкой
                        Button(action: {
                            // Действие для перехода к примечанию
                        }) {
                            HStack {
                                Text("Перейти к примечанию в Справке")
                                Image(systemName: "arrow.right")
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(Color(.systemGray5))
                            .foregroundColor(.primary)
                            .cornerRadius(8)
                        }
                    }
                    .padding(.bottom)
                }
                .padding(.horizontal)
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 5)
        .padding()
    }
}

struct DocumentEventDrawer_Previews: PreviewProvider {
    static var previews: some View {
        DocumentEventDrawer()
            .previewLayout(.sizeThatFits)
    }
}
