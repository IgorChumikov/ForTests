//
//  ProgressView_CurrentValue.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 ProgressView (iOS 14+) — параметр currentValueLabel
 
 • Позволяет отобразить текущее состояние выполнения (например, 20 из 100).
 • Подходит для загрузок, подсчёта файлов, шагов и т.п.
 • currentValueLabel можно кастомизировать: менять шрифт, цвет, стиль и т.д.
 
 */

import SwiftUI

struct ProgressView_CurrentValue: View {
    @State private var progress = 0.2
    @State private var current = 20
    @State private var total = 100
    
    var body: some View {
        VStack(spacing: 40) {
            
            HeaderView3(
                title: "ProgressView",
                subtitle: "Current Value Label",
                desc: "You can also use the currentValueLabel parameter to indicate progress values.",
                back: .blue,
                textColor: .white
            )
            
            // MARK: - Стандартный вариант
            ProgressView(
                value: progress,
                label: {
                    Text("Fetching Records")
                },
                currentValueLabel: {
                    Text("\(current) out of \(total)")
                }
            )
            .padding()
            
            Text("Allows customizations:")
                .font(.headline)
            
            // MARK: - Кастомизированный вариант
            ProgressView(
                value: progress,
                label: {
                    Text("Fetching Records")
                },
                currentValueLabel: {
                    Text("\(current) out of \(total)")
                        .font(.title3)
                        .italic()
                        .foregroundStyle(.green)
                }
            )
            .padding()
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    ProgressView_CurrentValue()
}
