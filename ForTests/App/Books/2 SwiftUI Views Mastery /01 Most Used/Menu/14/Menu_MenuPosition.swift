//
//  Menu_MenuPosition.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

import SwiftUI

/*
 Menu — автоматический выбор направления раскрытия (iOS 14+)

 • Меню само решает, куда раскрываться — вверх или вниз — в зависимости от позиции кнопки.
 • Если кнопка находится в верхней части экрана, меню откроется вниз.
 • Если ближе к нижней части — меню раскроется вверх, чтобы не выйти за границы экрана.
 • SwiftUI делает это автоматически, без дополнительной логики.
 • Поведение одинаковое для Menu в VStack, HStack, toolbars и любых контейнерах.
 */


import SwiftUI

struct Menu_MenuPosition: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Menu {
                    Button(action: {}) {
                        Text("Menu Item 1")
                        Image(systemName: "network")
                    }
                    
                    Button(action: {}) {
                        Text("Menu Item 2")
                        Image(systemName: "antenna.radiowaves.left.and.right")
                    }
                } label: {
                    Image(systemName: "slider.horizontal.3")
                        .padding(.leading, 20)
                }
                
                Spacer()
            }
            
            Spacer()
            
            HeaderView3(
                title: "Menu",
                subtitle: "Menu Position",
                desc: """
                You may notice that the menu seems to always expand upward and your \
                menu items are backwards. If the menu label (button) is toward the \
                top of the screen, then the menu will expand down from the button.
                """,
                back: .blue,
                textColor: .white
            )
            
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    Menu_MenuPosition()
}
