//
//  Image_ScaledMetric.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 @ScaledMetric (iOS 14+)

 • Позволяет масштабировать значения под Dynamic Type.
 • Используется для адаптивного UI.
 • Например: размер изображения растёт вместе с текстом.
*/

import SwiftUI

struct Image_ScaledMetric: View {

    // MARK: - Properties
    @ScaledMetric var size: CGFloat = 32

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Image")
                .font(.largeTitle)
            
            Text("Scaled Metric")
                .foregroundStyle(.gray)
            
            // MARK: - Описание
            Text("Размер изображения зависит от размера текста")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundStyle(.white)
            
            // MARK: - Пример
            HStack {
                Image("Fire")
                    .resizable()
                    .frame(width: size, height: size)
                
                Text("Растёт вместе с текстом")
            }
        }
        .font(.title)
        .padding()
    }
}

#Preview {
    Image_ScaledMetric()
}
