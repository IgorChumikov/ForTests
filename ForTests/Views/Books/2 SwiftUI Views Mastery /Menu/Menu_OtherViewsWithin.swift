//
//  Menu_OtherViewsWithin.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 Menu (iOS 14+) позволяет включать не только кнопки, но и другие элементы —
например, Divider или Text.
Это полезно, если нужно визуально разделить группы действий или добавить пояснение.

Важно: при нажатии на любой элемент внутри Menu — меню закроется.
 
 */

import SwiftUI

struct Menu_OtherViewsWithin: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Menu {
                    Button("Menu Item 1", action: {})
                    
                    Divider()
                    
                    Button(action: {}) {
                        Text("Dividers create a thicker separator")
                        Image(systemName: "hand.point.up")
                    }
                    
                    Divider()
                    
                    Text("This is a text view")
                        .font(.caption) // Не влияет на стиль меню
                        .textCase(.uppercase)
                    
                    Button(action: {}) {
                        Text("Menu text will use up to two lines if too long.")
                        Image(systemName: "paperplane")
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
                subtitle: "Other Views Within",
                desc: "You can include other views, not just buttons, inside the menu.",
                back: .blue,
                textColor: .white
            )
            
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    Menu_OtherViewsWithin()
}
