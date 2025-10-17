//
//  Scrollview_ContentMargins.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 ScrollView — contentMargins (iOS 17+)
 
 • Новый модификатор `.contentMargins()` добавляет внутренние отступы (margins)
   внутри прокручиваемых контейнеров: `ScrollView`, `List`, `Form` и т. д.
 • Можно задавать разные стороны (аналогично `.padding()`),
   а также управлять отступами отдельно для контента и для индикаторов прокрутки.
 
 */

import SwiftUI

struct ScrollView_ContentMargins: View {
    var body: some View {
        VStack(spacing: 40) {
            
            // MARK: - Пример 1: отступы вокруг контента
            ScrollingColorsView()
                .contentMargins(.vertical, 60.0)
                .border(Color.black)
            
            Text("""
            Add padding around a scrolling container (ScrollView, List, Form, etc.) with this modifier.
            You can set different edges like you would the padding modifier.
            """)
            .font(.body)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            
            // MARK: - Пример 2: отступ только для индикатора прокрутки
            ScrollingColorsView()
                .contentMargins(.bottom, 8, for: .scrollIndicators)
                .border(Color.black)
            
            Text("""
            You can also target a specific part of the scrolling container like the content or the scroll indicators.
            
            💡 In this example, the scroll indicator is being moved up so it’s closer to the color content.
            """)
            .font(.body)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
        }
        .padding()
        .font(.title)
    }
}

#Preview {
    ScrollView_ContentMargins()
}

import SwiftUI

/// Пример вспомогательного ScrollView с цветными блоками.
/// Используется в примерах для демонстрации поведения прокрутки.
struct ScrollingColorsView: View {
    private let colors: [Color] = [
        .green, .blue, .purple, .pink, .yellow, .orange
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 16) {
                ForEach(colors, id: \.self) { color in
                    RoundedRectangle(cornerRadius: 16)
                        .fill(color.gradient)
                        .frame(width: 200, height: 120)
                        .shadow(radius: 4, y: 2)
                }
            }
            .padding(.horizontal)
        }
        .scrollTargetLayout()
    }
}
