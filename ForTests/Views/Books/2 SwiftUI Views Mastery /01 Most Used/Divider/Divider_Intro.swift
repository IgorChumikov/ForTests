//
//  Divider_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Divider — разделитель

 • Divider — это линия для разделения элементов.
 • В VStack — горизонтальный.
 • В HStack — вертикальный.
 • Автоматически растягивается.
*/

import SwiftUI

struct Divider_Intro: View {

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Divider")
                .font(.largeTitle)
            
            Text("Введение")
                .foregroundStyle(.gray)
            
            // MARK: - Горизонтальный Divider
            Text("Горизонтальный Divider")
            
            Divider()
            
            Image(systemName: "arrow.left.and.right")
                .font(.system(size: 40))
            
            Divider()
            
            // MARK: - Описание
            Text("В VStack Divider горизонтальный")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundStyle(.white)
            
            // MARK: - Вертикальный Divider
            HStack {
                Text("Вертикальный")
                
                Divider()
                
                Image(systemName: "arrow.up.and.down")
                    .font(.system(size: 40))
                
                Divider()
            }
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    Divider_Intro()
}
