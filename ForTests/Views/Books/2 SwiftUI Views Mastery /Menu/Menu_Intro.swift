//
//  Menu_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 (iOS 14+)
 Menu — это выпадающее меню, добавленное в iOS 14.
 Используется для группировки действий в компактном виде.
 
 ControlGroup (с iOS 15) позволяет расположить элементы меню горизонтально.
 Цвет текста и иконок всегда соответствует системному primary —
 изменить его напрямую нельзя.
 
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
