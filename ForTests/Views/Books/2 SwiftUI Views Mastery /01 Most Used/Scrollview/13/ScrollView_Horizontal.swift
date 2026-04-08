//
//  ScrollView_Horizontal.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 ScrollView — горизонтальная прокрутка (iOS 13+)
 
 • Чтобы включить горизонтальную прокрутку, используйте
   `ScrollView(.horizontal)` или `ScrollView(Axis.Set.horizontal)`.
 • Часто применяется для галерей, карточек, баннеров и коллекций.
 • Можно комбинировать с `GeometryReader`, чтобы адаптировать размеры элементов под экран.
 
 */

import SwiftUI

struct ScrollView_Horizontal: View {
    var items = [
        Color.green, .blue, .purple, .pink, .yellow, .orange
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 16) {
                    ForEach(items, id: \.self) { color in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(color)
                            .frame(
                                width: geometry.size.width - 60,
                                height: 200
                            )
                            .shadow(radius: 4, y: 2)
                    }
                }
                .padding(.horizontal)
            }
        }
        .font(.title)
    }
}

#Preview {
    ScrollView_Horizontal()
}
