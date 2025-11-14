//
//  Picker_ProgrammaticSelection.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 Picker с программным выбором (iOS 14+)
 
 • Picker автоматически обновляет выбранный элемент,
   если изменяется привязанное свойство `@State`.
 • Это позволяет **программно** менять выбор,
   например по нажатию кнопки.
 • SwiftUI синхронизирует состояние и UI без дополнительных вызовов.
 
 */

import SwiftUI

struct Picker_ProgrammaticSelection: View {
    @State private var favoriteState = 1
    
    var body: some View {
        VStack(spacing: 20) {
            
            HeaderView(
                "Picker",
                subtitle: "Programmatic Selection",
                desc: "You can programmatically change the Picker selection just by changing the bound property."
            )
            
            // MARK: - Picker
            Picker("States", selection: $favoriteState) {
                Text("California").tag(0)
                Text("Colorado").tag(1)
                Text("Montana").tag(2)
                Text("Utah").tag(3)
                Text("Vermont").tag(4)
            }
            .pickerStyle(.wheel)
            .padding(.horizontal)
            
            Text("Selected tag: \(favoriteState)")
                .foregroundStyle(.secondary)
            
            // MARK: - Программное изменение выбора
            Button("Select Vermont") {
                withAnimation {
                    favoriteState = 4
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            
            Text("When you change the Picker’s bound property, it updates and selects the matching row.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Spacer()
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Picker_ProgrammaticSelection()
}
