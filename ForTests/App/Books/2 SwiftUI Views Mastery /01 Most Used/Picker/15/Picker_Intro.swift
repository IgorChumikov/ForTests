//
//  Picker_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 Picker (iOS 15+)
 
 • Начиная с **iOS 15**, стиль по умолчанию у `Picker` — **.menu**,
   ранее (до iOS 14) использовался стиль **.wheel**.
 • Picker связывается с состоянием через `@State` и использует `.tag()`
   для связи выбранного элемента с модельным свойством.
 • Каждый вариант выбора имеет уникальное значение `tag`,
   которое обновляет `selection` при выборе.
 
 */

import SwiftUI

struct Picker_Intro: View {
    @State private var favoriteState = 1
    
    var body: some View {
        VStack(spacing: 20) {
            
            HeaderView(
                "Picker",
                subtitle: "Introduction",
                desc: "You can associate a property with the picker rows' tag values."
            )
            
            // MARK: - Picker с привязкой к @State
            Picker("States", selection: $favoriteState) {
                Text("California").tag(0)
                Text("Utah").tag(1)
                Text("Vermont").tag(2)
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
    Picker_Intro()
}
