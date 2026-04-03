//
//  Group_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Group — группировка View

 • Group объединяет несколько View.
 • Не влияет на layout (в отличие от VStack/HStack).
 • Позволяет обойти ограничение в 10 элементов.
*/

import SwiftUI

struct Group_Intro: View {

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Group")
                .font(.largeTitle)
            
            Text("Введение")
                .foregroundStyle(.gray)
            
            // MARK: - Описание
            Text("Group позволяет объединять несколько View")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundStyle(.white)
            
            // MARK: - Много элементов
            Text("View 1")
            Text("View 2")
            Text("View 3")
            Text("View 4")
            Text("View 5")
            Text("View 6")
            Text("View 7")
            Text("View 8")
            Text("View 9")
            
            // MARK: - Group (после 10)
            Group {
                Text("Child View 1 (Group)")
                Text("Child View 2 (Group)")
            }
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    Group_Intro()
}
