//
//  ActionSheet_PresentingWithBool.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.04.2026.
//

/*
 ActionSheet — показ через Bool (iOS 14+)

 • Используем @State переменную для управления показом
 • При изменении значения на true — ActionSheet появляется
 • SwiftUI сам отслеживает состояние и обновляет UI
*/

import SwiftUI

struct ActionSheets_PresentWithBool: View {
    
    // MARK: - Properties
    
    // Флаг для показа ActionSheet
    @State private var presentingActionSheet = false
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("ActionSheet")
                .font(.largeTitle)
            
            Text("Presenting with Bool")
                .font(.title)
                .foregroundStyle(.gray)
            
            // Кнопка показа
            Button("Show ActionSheet") {
                // Меняем состояние → показываем ActionSheet
                presentingActionSheet = true
            }
        }
        // Подписка на состояние
        .actionSheet(isPresented: $presentingActionSheet) {
            
            ActionSheet(
                title: Text("My Action Sheet"),
                
                // Сообщение (необязательно)
                message: Text("Choose an option"),
                
                // Кнопки
                buttons: [
                    .default(Text("Default Button"), action: {
                        // действие
                    }),
                    .destructive(Text("Delete"), action: {
                        // удаление
                    }),
                    .cancel()
                ]
            )
        }
    }
}

#Preview {
    ActionSheets_PresentWithBool()
}
