//
//  Capsule_RoundedCornerStyle.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Capsule — стили скругления углов

 • Capsule поддерживает разные стили скругления.
 • circular — стандартное скругление (простое).
 • continuous — более плавное и современное (рекомендуется).
*/

import SwiftUI

struct Capsule_RoundedCornerStyle: View {

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Capsule")
                .font(.largeTitle)
            
            Text("Стили скругления")
                .foregroundStyle(.gray)
            
            // MARK: - Описание
            Text("Capsule поддерживает два стиля скругления углов:")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.purple)
                .foregroundStyle(.white)
            
            // MARK: - circular
            Text("RoundedCornerStyle.circular")
            
            Capsule(style: .circular)
                .frame(width: 200, height: 80)
                .padding()
            
            // MARK: - continuous
            Text("RoundedCornerStyle.continuous")
            
            Capsule(style: .continuous)
                .frame(width: 200, height: 80)
                .padding()
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    Capsule_RoundedCornerStyle()
}
