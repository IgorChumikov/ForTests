//
//  ViewThatFits_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 01.10.2025.
//

/*
Что такое ViewThatFits

Это контейнер, который перебирает список вьюшек и показывает первую, которая помещается в доступное пространство.
Очень удобно для адаптивной вёрстки: портрет/альбом, разные размеры экрана, компактный/полный режим.
Работает как .if-else для UI: «попробуй первый вариант, если не влез — переходи к следующему».
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
