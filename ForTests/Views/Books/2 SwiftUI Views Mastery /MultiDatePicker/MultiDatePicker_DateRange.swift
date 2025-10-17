//
//  MultiDatePicker_DateRange.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 MultiDatePicker (iOS 16+) поддерживает параметр `in:` —
он задаёт диапазон допустимых дат для выбора.
 
 Можно использовать:
 • закрытый диапазон (например, `startDate ..< endDate`)
 • открытые границы (`Date()...` или `..<Date()`)
 
 Это позволяет ограничить выбор, например, только будущими или прошлыми датами.
 
 */

import SwiftUI

struct MultiDatePicker_DateRange: View {
    @State private var dates: Set<DateComponents> = []
    
    // Диапазон: от текущей даты до 6 дней вперёд
    private var range = Date() ..< Calendar.current.date(byAdding: .day, value: 6, to: Date())!
    
    var body: some View {
        Form {
            MultiDatePicker("Date Range", selection: $dates, in: range)
            
            MultiDatePicker("After Date", selection: $dates, in: Date()...)
            
            MultiDatePicker("Before Date", selection: $dates, in: ..<Date())
        }
        .font(.title3)
    }
}

#Preview {
    MultiDatePicker_DateRange()
}
