//
//  Divider_Customization.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Divider — кастомизация

 • Цвет меняется через .background().
 • Размер меняется через .frame().
 • Толщину Divider изменить нельзя.
*/

import SwiftUI

struct Divider_Customization: View {

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Divider")
                .font(.largeTitle)
            
            Text("Кастомизация")
                .foregroundStyle(.gray)
            
            // MARK: - Цвет
            Text("Цвет Divider")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundStyle(.white)
            
            Text("Red")
            Divider()
                .background(Color.red)
            
            Text("Blue")
            Divider()
                .background(Color.blue)
            
            // MARK: - Размер
            Text("Меняем размер (не толщину)")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundStyle(.white)
            
            // Вертикальный
            HStack {
                Divider()
                    .frame(height: 40)
                
                Text("Меняем высоту")
                
                Divider()
                    .frame(height: 40)
            }
            
            // Горизонтальный
            Divider()
                .frame(width: 300)
            
            Text("Меняем ширину")
            
            Divider()
                .frame(width: 300)
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    Divider_Customization()
}
