//
//  ScrollView_Horizontal_SafeAreaInset.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 ScrollView — safeAreaInset с горизонтальной прокруткой (iOS 15+)
 
 • Модификатор `.safeAreaInset(edge:)` можно применять и к горизонтальному ScrollView.
 • Это позволяет добавлять элементы (например, стрелки, текст, подсказки) сбоку,
   не перекрывая контент и не нарушая логику прокрутки.
 • Контент ScrollView автоматически сдвигается, чтобы не налезать на inset.
 
 */

import SwiftUI

struct ScrollView_Horizontal_SafeAreaInset: View {
    var items = [
        Color.green, .blue, .purple, .pink, .yellow, .orange
    ]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack {
                        ForEach(items, id: \.self) { color in
                            RoundedRectangle(cornerRadius: 15)
                                .fill(color)
                                .frame(width: geometry.size.width - 60)
                                .shadow(radius: 3, y: 2)
                        }
                    }
                    .padding(.trailing)
                }
                // MARK: - Safe Area Inset (Leading Edge)
                .safeAreaInset(edge: .leading) {
                    VStack(spacing: 10) {
                        Text("Scroll")
                            .font(.body)
                        Image(systemName: "arrow.left.circle")
                            .font(.title2)
                    }
                    .frame(maxHeight: .infinity)
                    .padding(.horizontal)
                    .background(.regularMaterial)
                }
                .frame(height: 200)
                
                Spacer()
            }
        }
        .font(.title)
        .padding(.horizontal)
    }
}

#Preview {
    ScrollView_Horizontal_SafeAreaInset()
}
