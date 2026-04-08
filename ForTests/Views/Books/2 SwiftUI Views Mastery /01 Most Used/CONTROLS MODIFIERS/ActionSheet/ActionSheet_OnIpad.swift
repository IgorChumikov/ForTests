//
//  ActionSheet_OnIpad.swift
//  ForTests
//
//  Created by Игорь Чумиков on 08.04.2026.
//

/*
 ActionSheet — на iPad (iOS 14+)

 • На iPad отображается как popover
 • Модификатор нужно вешать на кнопку
 • Cancel кнопка может не отображаться
*/

import SwiftUI

struct ActionSheet_OnIpad: View {
    
    // MARK: - Properties
    @State private var presentingActionSheet = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("ActionSheet")
                .font(.largeTitle)
            
            Text("On iPad")
                .font(.title)
                .foregroundStyle(.gray)
            
            // Кнопка
            Button("Show ActionSheet") {
                presentingActionSheet = true
            }
            // ❗️ ВАЖНО: модификатор прямо на кнопке
            .actionSheet(isPresented: $presentingActionSheet) {
                ActionSheet(
                    title: Text("My Action Sheet"),
                    message: Text("Pick an option"),
                    buttons: [
                        .default(Text("Option 1"), action: {}),
                        .destructive(Text("Option 2"), action: {}),
                        .cancel(Text("Cancel"), action: {})
                    ]
                )
            }
            
            Spacer()
        }
    }
}

#Preview {
    ActionSheet_OnIpad()
}
