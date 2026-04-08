//
//  ActionSheet_Buttons.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.04.2026.
//

/*
 ActionSheet — кнопки (iOS 14+)

 • Кнопки почти не кастомизируются
 • Можно задать только текст и тип кнопки
 • Типы: default, destructive, cancel
*/

import SwiftUI

struct ActionSheet_Buttons: View {
    
    // MARK: - Properties
    
    @State private var presentingActionSheet = false
    
    // Сам ActionSheet вынесен в переменную (как в книге)
    var actionSheet: ActionSheet {
        ActionSheet(
            title: Text("Action Sheet Title"),
            buttons: [
                .default(Text("Default Button"), action: {
                    // действие
                }),
                .destructive(Text("Destructive Button"), action: {
                    // удаление
                }),
                .cancel(Text("Exit"), action: {
                    // закрытие
                })
            ]
        )
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("ActionSheet")
                .font(.largeTitle)
            
            Text("Buttons")
                .font(.title)
                .foregroundStyle(.gray)
            
            Text("Кнопки нельзя кастомизировать. Можно только задать текст и тип кнопки.")
                .multilineTextAlignment(.center)
            
            Button("Show ActionSheet") {
                presentingActionSheet = true
            }
        }
        .actionSheet(isPresented: $presentingActionSheet) {
            actionSheet
        }
    }
}

#Preview {
    ActionSheet_Buttons()
}
