//
//  Menu_InsideMenu.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 Menu внутри Menu — иерархия действий (iOS 14+)

 • Menu можно вкладывать друг в друга, создавая многоуровневые структуры действий.
 • Позволяет группировать команды по категориям: «More…», «Advanced», «Filters», «Tools».
 • Вложенные меню работают так же, как контекстные меню в macOS — раскрываются вправо.
 • Полезно, когда действий много, но интерфейс должен оставаться компактным.
 • Поддерживается с iOS 14, без дополнительных настроек.
 */


import SwiftUI

struct Menu_InsideMenu: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Menu("Edit") {
                Button("Add color", systemImage: "eyedropper.full") { }
                Button("Change contrast", systemImage: "circle.lefthalf.fill") { }
                
                Menu("More...") {
                    Button("Magic Wand", systemImage: "wand.and.stars") { }
                    Button("Magic Paint", systemImage: "paintbrush.fill") { }
                }
            }
            
            Spacer()
        }
        .font(.title)
    }
}


#Preview {
    Menu_InsideMenu()
}
