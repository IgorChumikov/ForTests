//
//  MultiDatePicker_Customizations.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 MultiDatePicker — кастомизация внешнего вида (iOS 16+)

 • .tint() — единственный модификатор, который реально влияет на UI
   MultiDatePicker. Меняет акцентный цвет выбранных дат (точки/обводка).

 • .foregroundStyle() — НЕ влияет на внутренний календарь.
   Работает только с внешними текстами/лейблами.

 • .background() — можно использовать для оформления контейнера вокруг
   MultiDatePicker (например, карточка, материал, уголки).

 • MultiDatePicker не поддерживает глубокую кастомизацию (свои шрифты,
   свои иконки и т. д.) — только системный стиль и tint.
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
