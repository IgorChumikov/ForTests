//
//  ViewThatFits_Vertical.swift
//  ForTests
//
//  Created by Игорь Чумиков on 01.10.2025.
//

/*
 ViewThatFits — вертикальная проверка размеров (iOS 16+)

 • Контейнер проверяет вьюшки сверху вниз и выбирает первую, которая помещается по высоте.
 • В портретной ориентации обычно больше вертикального пространства → выбирается первый вариант.
 • В альбомной ориентации высота ограничена → выбирается более компактный вариант.
 • Удобно для адаптации панелей, карточек и любых элементов с разной высотой.
 */


import SwiftUI

struct ViewThatFits_Vertical: View {
    var body: some View {
        ViewThatFits(in: .vertical) {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.purple.opacity(0.7))
                .overlay(Text("For Portrait"))
                .frame(width: 200, height: 500)

            RoundedRectangle(cornerRadius: 16)
                .fill(Color.blue.opacity(0.7))
                .overlay(Text("For Landscape"))
                .frame(width: 400, height: 100)

            Text("No views fit")
        }
    }
}

#Preview {
    ViewThatFits_Vertical()
}
