//
//  ProgressView_Customizing.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 ProgressView — кастомизация внешнего вида (iOS 14+)
 
 • Позволяет изменять цвет прогресс-бара через `.accentColor()` (или `.tint()` в новых версиях).
 • Можно добавить собственный фон, тени и подписи.
 • Для круглого индикатора (circular) цвет задаётся через `.progressViewStyle(CircularProgressViewStyle(tint:))`.
 
 */

import SwiftUI

struct ProgressView_Customizing: View {
    @State private var progress = 0.75
    
    var body: some View {
        VStack(spacing: 20) {
            
            HeaderView3(
                title: "ProgressView",
                subtitle: "Customizing",
                desc: "You can set the color of the progress indicator with an accent color and the text that goes with it by using a different initializer.",
                back: .blue,
                textColor: .white
            )
            
            // MARK: - Линейный прогресс с фоном и цветом
            ProgressView(value: progress, label: {
                HStack {
                    Spacer()
                    Text("Progress (\(Int(progress * 100))%)")
                        .font(.title)
                        .foregroundStyle(.white)
                    Spacer()
                }
            })
            .accentColor(.orange) // изменяет цвет полосы
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.blue)
                    .shadow(radius: 10, y: 16)
            )
            .padding(.horizontal)
            
            // MARK: - Круговой прогресс
            Text("For the circular progress view, you need to set the color through the style modifier:")
                .padding(.horizontal)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .orange))
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    ProgressView_Customizing()
}
