//
//  Color_Opacity.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Opacity (Alpha)

 • opacity управляет прозрачностью.
 • Значения от 0 до 1.
 • Можно задавать через модификатор или прямо в Color.
*/

import SwiftUI

struct Color_Opacity: View {

    // MARK: - Body
    var body: some View {
        ZStack {
            
            // MARK: - Фон
            Color.purple
            
            VStack(spacing: 20) {
                
                Text("Color")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                Text("Opacity")
                    .font(.title)
                    .foregroundStyle(.black)
                
                // MARK: - Описание
                Text("Можно управлять прозрачностью цвета")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        Color.black.opacity(0.25)
                    )
                    .foregroundStyle(.white)
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Color_Opacity()
}
