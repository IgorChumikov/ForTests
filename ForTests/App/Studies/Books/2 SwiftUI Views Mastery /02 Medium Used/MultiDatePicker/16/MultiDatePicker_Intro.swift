//
//  MultiDatePicker_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 MultiDatePicker — выбор нескольких дат сразу (iOS 16+)

 • Позволяет пользователю выбрать сразу несколько дат в календаре.
 • Работает через привязку к Set<DateComponents> — множество удобно,
   но оно не гарантирует порядок элементов.
 • Если нужен отсортированный список дат (например, для отображения в List),
   нужно вручную преобразовать Set → Array и отсортировать.
 • Подходит для выбора диапазонов, рабочих смен, событий и любых множественных дат.
 */


import SwiftUI

struct MultiDatePicker_Intro: View {
    @State private var dates: Set<DateComponents> = []
    
    var body: some View {
        VStack {
            MultiDatePicker("Date Range", selection: $dates)
            
            List {
                Section("Selected Dates") {
                    ForEach(Array(dates), id: \.self) { date in
                        if let month = date.month, let day = date.day {
                            Text("\(month)/\(day)")
                        }
                    }
                }
            }
        }
        .font(.title)
    }
}

#Preview {
    MultiDatePicker_Intro()
}
