//
//  Menu_Order.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 menuOrder — управление порядком элементов внутри Menu (iOS 16+)

 • Позволяет контролировать, как элементы располагаются,
   когда меню раскрывается вверх или вниз.

 • .priority (по умолчанию):
      – первый элемент списка всегда ближе к кнопке меню;
      – порядок "переворачивается" в зависимости от направления раскрытия.

 • .fixed:
      – порядок элементов всегда остаётся сверху вниз;
      – меню не инвертирует порядок, независимо от того,
        раскрывается оно вверх или вниз.

 • Полезно, когда требуется предсказуемый порядок пунктов или заранее заданная структура.
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
