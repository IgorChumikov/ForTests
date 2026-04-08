//
//  MultiDatePicker_DateRange.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 MultiDatePicker — ограничение выбора дат через параметр in: (iOS 16+)

 • Параметр in: задаёт диапазон допустимых дат, которые можно выбрать.
 • Поддерживает:
      – закрытые диапазоны: startDate ..< endDate
      – полуоткрытые диапазоны: Date()..., ..<Date()
 • Это позволяет ограничить выбор только будущими, только прошлыми
   или любым кастомным диапазоном.
 • Полезно для бронирований, расписаний, дат поездок и рабочих смен.
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
