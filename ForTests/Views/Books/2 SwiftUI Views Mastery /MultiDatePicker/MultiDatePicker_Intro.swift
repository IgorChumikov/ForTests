//
//  MultiDatePicker_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 MultiDatePicker (iOS 16+) позволяет выбрать несколько дат одновременно.
 Для этого используется привязка к множеству `Set<DateComponents>`.
 
 Выбранные даты неупорядочены — если нужен порядок, нужно отсортировать их вручную.
 
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
