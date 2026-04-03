//
//  Group_SharedModifiers.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Group + Modifiers

 • В Group модификаторы применяются к каждому элементу отдельно.
 • В VStack — ко всей группе как к одному View.
 • Это ключевое отличие Group от контейнеров.
*/

import SwiftUI

struct Group_SharedModifiers: View {

    // MARK: - Body
    var body: some View {
        VStack(spacing: 30) {
            
            Text("Group")
                .font(.largeTitle)
            
            Text("Общие модификаторы")
                .foregroundStyle(.gray)
            
            // MARK: - Group
            Group {
                Image(systemName: "leaf.arrow.circlepath")
                    .font(.largeTitle)
                
                Text("Please Recycle")
            }
            .padding()
            .background(Color.blue)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            // MARK: - VStack
            VStack {
                Image(systemName: "leaf.arrow.circlepath")
                    .font(.largeTitle)
                
                Text("Please Recycle")
            }
            .padding()
            .background(Color.blue)
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            // MARK: - Вывод
            Text("Group применяет модификаторы к каждому элементу отдельно")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundStyle(.white)
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    Group_SharedModifiers()
}
