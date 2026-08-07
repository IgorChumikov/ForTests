//
//  Picker_Wheel.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 Picker с колесом выбора (iOS 14+)
 
 • До iOS 15 стиль `.wheel` был **стилем по умолчанию**,
   теперь по умолчанию используется `.menu`.
 • Чтобы вернуть классический вид колеса — установи `.pickerStyle(.wheel)`.
 • Значение по умолчанию определяется переменной `@State`,
   и соответствует элементу с совпадающим `.tag`.
 
 */

import SwiftUI

struct Picker_Wheel: View {
    @State private var yourName = "Mark" // Значение по умолчанию для Picker
    
    var body: some View {
        VStack(spacing: 20) {
            
            HeaderView(
                "Picker",
                subtitle: "Wheel Style",
                desc: "You can change the way a Picker looks by using the pickerStyle modifier."
            )
            
            // MARK: - Колесо выбора
            Picker("Name", selection: $yourName) {
                Text("Paul").tag("Paul")
                Text("Chris").tag("Chris")
                Text("Mark").tag("Mark")
                Text("Scott").tag("Scott")
                Text("Meng").tag("Meng")
            }
            .pickerStyle(.wheel) // стиль “колесо”
            
            Text("Selected: \(yourName)")
                .foregroundStyle(.secondary)
            
            Spacer()
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Picker_Wheel()
}
