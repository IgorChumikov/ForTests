//
//  Menu_InsideMenu.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 (iOS 14+)
 Menu можно вкладывать друг в друга, создавая иерархию действий.
 Это полезно, если нужно сгруппировать команды по смыслу (например, "More..." → дополнительные опции).
 
 Вложенные меню поддерживаются начиная с iOS 14.
 
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
