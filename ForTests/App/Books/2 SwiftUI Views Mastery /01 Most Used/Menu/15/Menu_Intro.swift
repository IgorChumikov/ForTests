//
//  Menu_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 Menu — компактное выпадающее меню действий (iOS 14+)

 • Позволяет группировать несколько кнопок в компактное выпадающее меню.
 • Отлично подходит для второстепенных или вспомогательных действий: «Edit», «More», «Options».
 • Кастомизация ограничена — цвет текста и иконок всегда соответствует системному primary.

 • ControlGroup (iOS 15+) можно использовать внутри Menu,
   чтобы расположить элементы горизонтально и визуально объединить их.

 • Используется в тулбарах, карточках, списках, контекстных меню и любой панели действий.
 */


import SwiftUI

struct Menu_Intro: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Menu("Edit") {
                ControlGroup {
                    Button("Add color", systemImage: "eyedropper.full") { }
                    Button("Change Contrast", systemImage: "circle.lefthalf.fill") { }
                }
                Button("Erase", systemImage: "eraser.fill") { }
                Button("Scribble Tool", systemImage: "scribble.variable") { }
            }
            
            Spacer()
        }
        .font(.title)
    }
}


#Preview {
    Menu_Intro()
}
