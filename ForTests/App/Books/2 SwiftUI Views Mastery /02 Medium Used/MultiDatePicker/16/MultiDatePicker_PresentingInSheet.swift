//
//  MultiDatePicker_PresentingInSheet.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 MultiDatePicker внутри .sheet() (iOS 16+)

 • MultiDatePicker отлично работает в шторках и модальных окнах.
 • .sheet(isPresented:) — открывает выбор дат.
 • .presentationDetents([.medium]) — задаёт высоту шторки (можно .large, .fraction и т.д.).
 • Перед выводом даты сортируются, чтобы пользователь видел их в естественном порядке.
 • Форматтер .list(type: .and, width: .short) превращает массив дат в удобочитаемую строку
   вида “9/6, 9/7 и 9/8”.
 
 Особенности:
 • MultiDatePicker внутри sheet не теряет состояние при закрытии.
 • Лучше оборачивать его в VStack для управления отступами и кнопкой “Done”.
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
