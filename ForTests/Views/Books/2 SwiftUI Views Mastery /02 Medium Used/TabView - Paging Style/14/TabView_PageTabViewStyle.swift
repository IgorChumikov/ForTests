//
//  TabView_PageTabViewStyle.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.11.2025.
//

/*
 TabView — PageTabViewStyle (iOS 14+)

 • Позволяет листать страницы горизонтально.
 • Используется для онбордингов, каруселей и страниц с контентом.
 • Модификатор .tabViewStyle(.page) включает постраничный режим.
*/

import SwiftUI

struct TabView_PageTabViewStyle: View {
    var body: some View {
        TabView {
            VStack(spacing: 20) {
                Text("PAGE 1")
                HStack {
                    Image(systemName: "1.circle")
                    Image(systemName: "learn")
                }
            }

            VStack(spacing: 20) {
                Text("PAGE 2")
                HStack {
                    Image(systemName: "arrow.left.circle")
                    Image(systemName: "2.circle")
                    Image(systemName: "arrow.right.circle")
                }
            }

            VStack(spacing: 20) {
                Text("PAGE 3")
                HStack {
                    Image(systemName: "arrow.left.circle")
                    Image(systemName: "3.circle")
                }
            }
        }
        .font(.title)
        .tabViewStyle(.page) // включает свайп между страницами
    }
}

#Preview {
    TabView_PageTabViewStyle()
}
