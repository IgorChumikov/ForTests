//
//  Image_ForegroundStyle.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 foregroundStyle для SF Symbols (iOS 15+)
 
 • Позволяет задавать несколько цветов для иконки
 • Поддерживает multi-color symbols
 • При нескольких цветах автоматически используется .palette
 */

import SwiftUI

struct Image_ForegroundStyle: View {
    
    var body: some View {
        VStack(spacing: 20) {
            
            HeaderView3(
                title: "Image - Symbols",
                subtitle: "ForegroundStyle",
                desc: "Используй foregroundStyle, чтобы задать несколько цветов для иконки.",
                back: .red,
                textColor: .primary
            )
            .layoutPriority(1)
            
            List {
                
                Label("Green", systemImage: "gauge.badge.plus")
                    .foregroundStyle(.green)
                
                Label("Green, Red", systemImage: "gauge.badge.plus")
                    .foregroundStyle(.green, .red)
                
                Label("Green, Red, Yellow", systemImage: "arrow.uturn.backward")
                    .foregroundStyle(.green, .red, .yellow)
                
                Label("Green, Red, Yellow", systemImage: "arrow.uturn.backward.circle")
                    .foregroundStyle(.green, .red, .yellow)
                
                Label("Green, Red, Yellow", systemImage: "arrow.uturn.backward.circle.fill")
                    .foregroundStyle(.green, .red, .yellow)
            }
            
            DescView2(desc: "Подсказка: чаще всего используется 2 цвета (основной + secondary)", back: .red, textColor: .black)        }
        
        .font(.title)
    }
}

#Preview {
    Image_ForegroundStyle()
}
