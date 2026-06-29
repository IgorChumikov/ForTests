//
//  ScrollView_SafeAreaInset.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 ScrollView — использование safeAreaInset (iOS 15+)
 
 • Модификатор `.safeAreaInset(edge:content:)` позволяет добавить фиксированную зону контента
   (например, панель, кнопку или счётчик) внутри безопасной области интерфейса.
 • При прокрутке контент будет двигаться под этой вставкой,
   но последний элемент останется полностью видимым при достижении конца списка.
 
 */

import SwiftUI

struct ScrollView_SafeAreaInset: View {
    @State private var names = [
        "Scott", "Mark", "Chris", "Sean", "Rod", "Meng", "Natasha",
        "Chase", "Evans", "Paul", "Durtschi", "Max"
    ]
    
    var body: some View {
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
                    Color.white.shadow(.drop(radius: 1, y: 1)),
                    in: RoundedRectangle(cornerRadius: 8)
                )
                .padding(.horizontal)
                .padding(.bottom, 4)
            }
        }
        // MARK: - Safe Area Inset (iOS 15+)
        .safeAreaInset(edge: .bottom) {
            VStack(spacing: 20) {
                Divider()
                Text("Last row")
                Text("12 People")
                    .font(.headline)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .background(.regularMaterial)
        }
        .font(.title)
    }
}

#Preview {
    ScrollView_SafeAreaInset()
}
