//
//  Picker_InForm.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 Picker внутри Form (iOS 14+)
 
 • Внутри `Form` разные стили Picker отображаются по-разному.
 • `.menu` делает выбор в виде всплывающего списка с акцентным цветом.
 • `.inline` создаёт собственную секцию внутри формы.
 • `.wheel` отображается как прокручиваемое колесо.
 
 Использование разных стилей помогает адаптировать интерфейс под контекст:
 например, меню для настроек, колесо — для частого выбора.
 
 */

import SwiftUI

struct Picker_InForm: View {
    @State private var selectedDaysOption = "2"
    var numberOfDaysOptions = ["1", "2", "3", "4", "5"]
    
    var body: some View {
        VStack {
            Form {
                // MARK: - Стиль по умолчанию (menu c iOS 15)
                Picker("Frequency", selection: $selectedDaysOption) {
                    ForEach(numberOfDaysOptions, id: \.self) {
                        Text("\($0) Days").tag($0)
                    }
                }
                
                // MARK: - Menu стиль (использует accentColor)
                Picker("Frequency", selection: $selectedDaysOption) {
                    ForEach(numberOfDaysOptions, id: \.self) {
                        Text("\($0) Days").tag($0)
                    }
                }
                .pickerStyle(.menu)
                
                // MARK: - Inline стиль (встраивается в форму)
                Picker("Frequency", selection: $selectedDaysOption) {
                    ForEach(numberOfDaysOptions, id: \.self) {
                        Text("\($0) Days").tag($0)
                    }
                }
                .pickerStyle(.inline)
                
                // MARK: - Wheel стиль (колесо выбора)
                Picker("Frequency", selection: $selectedDaysOption) {
                    ForEach(numberOfDaysOptions, id: \.self) {
                        Text("\($0) Days").tag($0)
                    }
                }
                .pickerStyle(.wheel)
            }
        }
        .font(.title)
    }
}

#Preview {
    Picker_InForm()
}
