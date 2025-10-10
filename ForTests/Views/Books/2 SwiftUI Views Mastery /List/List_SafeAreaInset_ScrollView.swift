//
//  List_SafeAreaInset_ScrollView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.10.2025.
//

// Этот пример показывает, что safeAreaInset работает универсально — он не привязан к конкретному типу контейнера (List, ScrollView, Form, VStack, и т.д.).

import SwiftUI

struct List_SafeAreaInset_ScrollView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Заголовок примера
            HeaderViewScroll(
                title: "ScrollView",
                subtitle: "SafeAreaInset",
                desc: "SafeAreaInset works well with the ScrollView."
            )
            
            // Прокручиваемое содержимое
            ScrollView {
                // 20 элементов в вертикальном списке
                ForEach(1..<21) { number in
                    Text("\(number)")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.green, in: RoundedRectangle(cornerRadius: 10))
                        .padding(.vertical, 4)
                }
                .padding(.horizontal)
            }
            // Добавляем вставку в нижнюю безопасную область
            .safeAreaInset(edge: .bottom) {
                VStack {
                    Divider()
                    Text("Total: 20")
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity)
                .background(.bar)
            }
        }
        .font(.title3)
    }
}

// MARK: - Заголовок для демо
struct HeaderViewScroll: View {
    let title: String
    let subtitle: String
    let desc: String
    var back: Color = .green
    var textColor: Color = .black
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.largeTitle).bold()
            Text(subtitle)
                .font(.headline)
                .foregroundStyle(.secondary)
            Text(desc)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(textColor.opacity(0.7))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(back.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    List_SafeAreaInset_ScrollView()
}
