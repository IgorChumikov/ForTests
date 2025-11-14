//
//  TabView_PageTabViewStyle_IndexViewStyle.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 TabView — индикаторы страниц (iOS 14+)

 • .indexViewStyle(.page(backgroundDisplayMode: .always)) заставляет индикаторы отображаться постоянно.
 • Используется вместе с .tabViewStyle(.page).
 • Удобно, если фон совпадает по цвету с точками.
*/

import SwiftUI

struct TabView_PageTabViewStyle_IndexViewStyle: View {
    var body: some View {
        TabView {
            VStack(spacing: 20) {
                Text("PAGE 1")
                Image(systemName: "arrow.down.circle")
                    .padding(.bottom, 45)
            }

            VStack {
                Text("PAGE 2")
            }

            VStack {
                Text("PAGE 3")
            }
        }
        .font(.title)
        .tabViewStyle(.page) // активирует перелистывание
        .indexViewStyle(.page(backgroundDisplayMode: .always)) // точки всегда видимы
    }
}

#Preview {
    TabView_PageTabViewStyle_IndexViewStyle()
}
