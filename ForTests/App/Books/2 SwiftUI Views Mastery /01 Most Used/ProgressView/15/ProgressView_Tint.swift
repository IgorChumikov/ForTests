//
//  ProgressView_Tint.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 ProgressView — использование tint (iOS 15+)
 
 • Начиная с iOS 15 можно использовать модификатор `.tint(_:)`
   для изменения цвета прогресс-бара (вместо устаревшего `.accentColor()`).
 • Работает как для линейного, так и для кругового индикатора.
 • Удобно комбинируется с кастомным фоном, тенью и подписями.
 
 */

import SwiftUI

struct ProgressView_Tint: View {
    @State private var progress = 0.75
    
    var body: some View {
        VStack(spacing: 20) {
            
            HeaderView3(
                title: "ProgressView",
                subtitle: "Tint",
                desc: "Starting in iOS 15, you can use the tint modifier to change the color of the progress views.",
                back: .blue,
                textColor: .white
            )
            
            // MARK: - Линейный прогресс с цветом через tint
            ProgressView(value: progress, label: {
                HStack {
                    Spacer()
                    Text("Progress (\(Int(progress * 100))%)")
                        .font(.title)
                        .foregroundStyle(.white)
                    Spacer()
                }
            })
            .tint(.mint) // iOS 15+
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color("GoldColor"))
                    .shadow(radius: 10, y: 16)
            )
            .padding(.horizontal)
            
            // MARK: - Круговой прогресс
            Text("For the circular progress view, you need to set the color through the style modifier:")
                .padding(.horizontal)
            
            ProgressView()
                .tint(.red)
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    ProgressView_Tint()
}
