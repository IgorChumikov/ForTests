//
//  Picker_Customized.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 Picker с кастомизацией внешнего вида (iOS 14+)
 
 • К каждому Picker можно применять стандартные модификаторы SwiftUI:
   отступы, фон, скругления и обводку.
 • `.pickerStyle(.wheel)` позволяет совместить классический стиль
   с визуальным оформлением через контейнеры (`RoundedRectangle`, `fill`, `stroke`).
 • Можно использовать разные типы данных в одном экране (Int и String).
 
 */

import SwiftUI

struct Picker_Customized: View {
    @State private var favoriteState = 1
    @State private var youTuberName = "Mark"
    
    var body: some View {
        VStack(spacing: 16) {
            
            // MARK: - Заголовок
            Text("Picker")
                .font(.largeTitle)
            Text("With Modifiers")
                .foregroundStyle(.gray)
            
            // MARK: - Первый Picker (с фоном)
            Text("Your Favorite State:")
            
            Picker("Select State", selection: $favoriteState) {
                Text("California").tag(0)
                Text("Utah").tag(1)
                Text("Vermont").tag(2)
            }
            .pickerStyle(.wheel)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue.opacity(0.2))
            )
            .padding()
            
            // MARK: - Второй Picker (с обводкой)
            Text("Who do you want to watch today?")
            
            Picker("Select person", selection: $youTuberName) {
                Text("Paul").tag("Paul")
                Text("Chris").tag("Chris")
                Text("Mark").tag("Mark")
                Text("Scott").tag("Scott")
                Text("Meng").tag("Meng")
            }
            .pickerStyle(.wheel)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue, lineWidth: 2)
            )
            .padding()
            
            // MARK: - Выбранные значения
            VStack(spacing: 8) {
                Text("Selected State Tag: \(favoriteState)")
                    .foregroundStyle(.secondary)
                Text("Selected YouTuber: \(youTuberName)")
                    .foregroundStyle(.secondary)
            }
            .padding(.top, 10)
            
            Spacer()
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Picker_Customized()
}
