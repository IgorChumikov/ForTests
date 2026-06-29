//
//  ProgressView_Total.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 ProgressView — настройка диапазона (iOS 14+)
 
 • По умолчанию диапазон прогресса — от 0.0 до 1.0.
 • Можно задать своё «total» значение — максимальный предел, например 0.5, 10, 100 и т.д.
 • Это удобно, когда прогресс нужно считать относительно конкретного количества (файлов, шагов, процентов).
 
 */

import SwiftUI

struct ProgressView_Total: View {
    @State private var total = 0.5
    @State private var progress = 0.4
    
    var body: some View {
        VStack(spacing: 40) {
            
            HeaderView3(
                title: "ProgressView",
                subtitle: "Adjusting the Total",
                desc: "By default, the progress view's range is from 0 to 1. You can change the end total amount though (to something less than 1).",
                back: .blue,
                textColor: .white
            )
            
            // MARK: - Пример с собственным total-значением
            ProgressView(
                "Files downloaded: \(Int(progress / total * 100))%",
                value: progress,
                total: total
            )
            .padding()
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    ProgressView_Total()
}
