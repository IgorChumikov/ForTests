//
//  MultiDatePicker_PresentingInSheet.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 MultiDatePicker (iOS 16+) можно удобно размещать внутри .sheet().
 
 В этом примере даты сортируются перед отображением,
а затем показываются в виде строки с помощью форматтера `.list`.
 
 • `.sheet` — открывает модальное окно выбора дат.
 • `.presentationDetents([.medium])` — задаёт высоту шторки.
 • Используется сортировка по дате и форматирование списка для читаемого вывода.
 
 */

import SwiftUI

struct MultiDatePicker_PresentingInSheet: View {
    @State private var showDates = false
    @State private var dates: Set<DateComponents> = []
    
    // Сортируем даты и превращаем их в массив строк
    private var datesArray: [String] {
        dates.sorted {
            ($0.date ?? .distantPast) < ($1.date ?? .distantPast)
        }
        .compactMap { date in
            if let month = date.month, let day = date.day {
                return "\(month)/\(day)"
            }
            return nil
        }
    }
    
    var body: some View {
        VStack {
            LabeledContent("Dates:") {
                Button {
                    showDates = true
                } label: {
                    if dates.isEmpty {
                        Text("Select")
                    } else {
                        Text(datesArray, format: .list(type: .and, width: .short))
                    }
                }
            }
            .padding()
            
            Spacer()
        }
        .sheet(isPresented: $showDates) {
            VStack {
                MultiDatePicker("Select Dates", selection: $dates)
                    .padding()
                
                Button("Done") { showDates = false }
                    .buttonStyle(.borderedProminent)
            }
            .presentationDetents([.medium])
        }
        .font(.title)
    }
}

#Preview {
    MultiDatePicker_PresentingInSheet()
}
