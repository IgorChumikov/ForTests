//
//  ViewThatFits_WithScrollView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 01.10.2025.
//

/*
 ViewThatFits — автоматическое включение ScrollView при нехватке места (iOS 16+)

 • Контейнер сначала пытается отобразить VStack целиком.
 • Если содержимое помещается на экране — используется первый вариант, без прокрутки.
 • Если места не хватает — выбирается второй вариант, обёрнутый в ScrollView.
 • Удобно для адаптивных списков, форм и динамического контента.
 */


import SwiftUI

struct ViewThatFits_WithScrollView: View {
    var body: some View {
        ViewThatFits {
            repeatedDataView
            
            ScrollView {
                repeatedDataView
            }
        }
        .font(.largeTitle)
    }
    
    var repeatedDataView: some View {
        VStack {
            ForEach(0..<15) { index in
                Image(systemName: "\(index).circle")
                    .padding()
            }
        }
    }
}

#Preview {
    ViewThatFits_WithScrollView()
}
