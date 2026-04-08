//
//  Image_Resizing.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Image — изменение размера

 • .resizable() позволяет менять размер.
 • Без scaling — изображение искажается.
 • .scaledToFit() сохраняет пропорции.
 • .scaledToFill() заполняет всё (может обрезать).
*/

import SwiftUI

struct Image_Resizing: View {

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Image")
                .font(.largeTitle)
            
            Text("Resizing")
                .foregroundStyle(.gray)
            
            // MARK: - Без scaling
            Text("Без масштабирования")
            
            Image("Fire")
                .resizable()
                .frame(width: 100, height: 150)
                .background(Color.gray)
            
            // MARK: - ScaledToFit
            Text("Scaled to Fit")
            
            Image("Fire")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .background(Color.gray)
            
            // MARK: - ScaledToFill
            Text("Scaled to Fill")
            
            Image("Fire")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipped()
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    Image_Resizing()
}
