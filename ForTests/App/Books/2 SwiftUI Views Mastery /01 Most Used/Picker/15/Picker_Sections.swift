//
//  Picker_Sections.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 Picker с секциями (iOS 15+)
 
 • Внутри `Picker` можно использовать `Section`, чтобы логически сгруппировать варианты выбора.
 • Каждая секция может содержать собственный `header` и `footer`.
 • Работает как в `.menu`, так и в `.wheel` стиле, но визуально группы заметны
   только в menu-стиле.
 
 */

import SwiftUI

struct Picker_Sections: View {
    @State private var favoriteState = 1
    
    var body: some View {
        VStack(spacing: 20) {
            
            HeaderView(
                "Picker",
                subtitle: "Sections",
                desc: "Use sections within your picker values to organize selections."
            )
            
            // MARK: - Picker с секциями
            Picker("States", selection: $favoriteState) {
                Section {
                    Text("California").tag(0)
                    Text("Utah").tag(1)
                } header: {
                    Text("West")
                }
                
                Section {
                    Text("Vermont").tag(2)
                    Text("New Hampshire").tag(3)
                } header: {
                    Text("East")
                }
            }
            .pickerStyle(.menu) // стиль по умолчанию с iOS 15
            
            Text("Selected tag: \(favoriteState)")
                .foregroundStyle(.secondary)
            
            Spacer()
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Picker_Sections()
}
