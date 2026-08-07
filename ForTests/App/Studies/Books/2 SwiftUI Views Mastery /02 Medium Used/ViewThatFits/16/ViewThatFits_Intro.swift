//
//  ViewThatFits_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 01.10.2025.
//

/*
 ViewThatFits — адаптивный выбор вьюшек (iOS 16+)

 • Контейнер перебирает вложенные вью и отображает первую, которая помещается в доступное пространство.
 • Отлично подходит для адаптивных интерфейсов: портрет/альбом, iPhone/iPad, Split View, компактный/расширенный режим.
 • Работает как визуальный if-else: «если первая вью не помещается — показать следующую».
 • Удобен для адаптации кнопок, карточек, панелей и любых элементов с жёсткой шириной/высотой.
 */

import SwiftUI

struct ViewThatFits_Intro: View {
    var body: some View {
        ViewThatFits(in: .horizontal) {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.pink.opacity(0.7))
                .overlay(Text("For Landscape"))
                .frame(width: 700, height: 75)

            RoundedRectangle(cornerRadius: 16)
                .fill(Color.orange.opacity(0.7))
                .overlay(Text("For Portrait"))
                .frame(width: 350, height: 75)

            Text("No views fit")
        }

    }
}

#Preview {
    ViewThatFits_Intro()
}
