//
//  Menu_Order.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 Menu поддерживает управление порядком отображения элементов с помощью `.menuOrder()`.
 
 • `.priority` (по умолчанию) — первый пункт меню всегда ближе к кнопке, независимо от того,
   раскрывается меню вверх или вниз.
 • `.fixed` — сохраняет порядок элементов сверху вниз, вне зависимости от направления раскрытия.
 
 Доступно начиная с iOS 16.
 
 */

import SwiftUI

struct Menu_Order: View {
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            HStack(spacing: 32) {
                // Меню с приоритетным порядком (по умолчанию)
                Menu("Priority") {
                    Text("""
                    With priority menu order,
                    the first item is always
                    closest to the menu button
                    whether the menu goes up or down
                    from the button.
                    """)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    
                    Button("Menu Item 1", action: {})
                    Button("Menu Item 2", action: {})
                    Button("Menu Item 3", action: {})
                    Button("Menu Item 4", action: {})
                    Button("Menu Item 5", action: {})
                }
                .menuOrder(.priority) // Default
                
                // Меню с фиксированным порядком
                Menu("Fixed Order") {
                    Button("Menu Item 1", action: {})
                    Button("Menu Item 2", action: {})
                    
                    Text("""
                    The fixed menu order will
                    maintain the order from
                    top to bottom no matter
                    how the menu is displayed.
                    """)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    
                    Button("Menu Item 3", action: {})
                    Button("Menu Item 4", action: {})
                    Button("Menu Item 5", action: {})
                }
                .menuOrder(.fixed)
            }
        }
        .font(.title)
    }
}

#Preview {
    Menu_Order()
}
