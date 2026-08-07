//
//  ProgressView_ShowingProgress.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 ProgressView (iOS 14+) — отображение прогресса
 
 • Используется для визуального показа выполнения задачи.
 • Можно передавать значение `value` от 0.0 до 1.0 — это процент выполнения.
 • Также можно добавить текстовую метку (label) для отображения процента.
 
 */

import SwiftUI

struct ProgressView_ShowingProgress: View {
    @State private var progress = 0.75
    
    var body: some View {
        VStack(spacing: 20) {
            
            HeaderView3(
                title: "ProgressView",
                subtitle: "Showing Progress",
                desc: "You can one-way bind data to your ProgressView to show progression.",
                back: .blue,
                textColor: .white
            )
            
            // MARK: - Индикатор прогресса без подписи
            ProgressView(value: progress)
                .padding()
            
            DescView2(
                desc: "And with a label:",
                back: .blue,
                textColor: .white
            )
            
            // MARK: - Индикатор прогресса с процентом
            ProgressView("Progress (\(Int(progress * 100))%)", value: progress)
                .padding()
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    ProgressView_ShowingProgress()
}
