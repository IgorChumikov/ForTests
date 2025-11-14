//
//  CUV_Paging.swift
//  ForTests
//
//  Created by Игорь Чумиков on 01.10.2025.
//

/*
 ContentUnavailableView — постраничное пролистывание с TabView (iOS 17+)

 • Показывает, как использовать ContentUnavailableView внутри TabView.
 • Сочетание .tabViewStyle(.page) даёт эффект горизонтального paging-скролла.
 • .indexViewStyle добавляет индикатор страниц, как в онбордингах.
 • Подходит для обучающих экранов, онбординга, презентаций и подсказок.
 */


import SwiftUI

struct CUV_Paging: View {
    var body: some View {
        TabView {
            ContentUnavailableView(
                "Look",
                image: "look",
                description: Text("Look through all the pictures in the book")
            )
            
            ContentUnavailableView(
                "Learn",
                image: "learn",
                description: Text("Learn what is possible.")
            )
            
            ContentUnavailableView(
                "Remember",
                image: "look",
                description: Text("You can remember pictures 60k faster than code.")
            )
        }
        .tabViewStyle(.page) // постраничная прокрутка
        .indexViewStyle(.page(backgroundDisplayMode: .always)) // индикатор страниц
    }
}


#Preview {
    CUV_Paging()
}
