//
//  MultiDatePicker_Customizations.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 MultiDatePicker (iOS 16+) поддерживает базовую кастомизацию через `.tint(_:)`.
 
 • `.tint()` — изменяет акцентный цвет выбора дат (точки, рамки, выделения).
 • `.foregroundStyle()` — не влияет на внешний вид MultiDatePicker.
 • `.background()` — можно использовать для обёртки всего компонента.
 
 */

import SwiftUI

struct MultiDatePicker_Customizations: View {
    @State private var dates: Set<DateComponents> = [
        DateComponents(year: 2022, month: 9, day: 6),
        DateComponents(year: 2022, month: 9, day: 7),
        DateComponents(year: 2022, month: 9, day: 8)
    ]
    
    var body: some View {
        MultiDatePicker("Customizations", selection: $dates)
            .tint(.red) // Изменяет цвет выделения дат
            .foregroundStyle(.purple) // Не оказывает эффекта
            .background(
                .quaternary.opacity(0.5),
                in: RoundedRectangle(cornerRadius: 16)
            )
            .padding()
    }
}

#Preview {
    MultiDatePicker_Customizations()
}
