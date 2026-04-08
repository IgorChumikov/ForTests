//
//  Picker_NavigationLinkStyle.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 Picker с навигационным стилем (iOS 16+)
 
 • `.pickerStyle(.navigationLink)` отображает Picker как NavigationLink —
   при нажатии открывается новый экран со списком возможных вариантов.
 • Такой стиль особенно удобен внутри `Form`, где пользователь ожидает
   переход на отдельный экран для выбора значения.
 
 */

import SwiftUI

struct Picker_NavigationLinkStyle: View {
    @State private var selectedDev = 0
    
    var body: some View {
        NavigationStack {
            Form {
                // MARK: - Picker в стиле NavigationLink
                Picker("iOS Dev", selection: $selectedDev) {
                    Text("Lem").tag(0)
                    Text("Mark").tag(1)
                    Text("Rod").tag(2)
                }
                .pickerStyle(.navigationLink)
            }
            .navigationTitle("Picker Style")
            .font(.title)
        }
    }
}

#Preview {
    Picker_NavigationLinkStyle()
}
