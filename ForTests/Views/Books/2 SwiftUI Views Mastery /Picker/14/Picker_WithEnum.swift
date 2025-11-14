//
//  Picker_WithEnum.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 Picker с Enum (iOS 14+)
 
 • Если enum реализует `CaseIterable`, можно использовать свойство `allCases`
   для автоматического заполнения Picker.
 • Реализация `Identifiable` позволяет напрямую использовать enum в `ForEach`.
 • Это удобный способ создать типобезопасный список значений
   без ручного объявления строк или чисел.
 
 */

import SwiftUI

struct Picker_WithEnum: View {
    
    // MARK: - Enum для выбора
    enum EyeColor: String, Identifiable, CaseIterable {
        var id: Self { self }
        case unspecified = "Unspecified"
        case blue = "Blue"
        case brown = "Brown"
        case hazel = "Hazel"
    }
    
    @State private var selectedEyeColor = EyeColor.unspecified
    
    var body: some View {
        Form {
            Picker("Eye Color", selection: $selectedEyeColor) {
                ForEach(EyeColor.allCases) { color in
                    Text(color.rawValue)
                }
            }
        }
        .font(.title)
    }
}

#Preview {
    Picker_WithEnum()
}
