//
//  ScrollView_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 ScrollView — базовое использование (iOS 13+)
 
 • Позволяет делать контент прокручиваемым по вертикали или горизонтали.
 • В отличие от List, ScrollView не имеет разделителей и не добавляет системный стиль.
 • Часто используется с ForEach для отображения коллекций данных вручную.
 
 */

import SwiftUI

struct ScrollView_Intro: View {
    @State private var names = [
        "Scott", "Mark", "Chris", "Sean", "Rod", "Meng", "Natasha",
        "Chase", "Evans", "Paul", "Durtschi", "Max"
    ]
    
    var body: some View {
        // Оборачиваем ForEach в ScrollView
        ScrollView {
            ForEach(names, id: \.self) { name in
                HStack {
                    Text(name)
                        .foregroundStyle(.primary)
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundStyle(.green)
                    Spacer()
                }
                .padding()
                .background(
                    Color.white
                        .shadow(.drop(radius: 1, y: 1)),
                    in: RoundedRectangle(cornerRadius: 8)
                )
                .padding(.bottom, 4)
            }
            .padding(.horizontal)
        }
        .font(.title)
        .padding(.top)
    }
}

#Preview {
    ScrollView_Intro()
}
