//
//  List_WithChildren.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.10.2025.
//

/*
 
List(parents, children: \.children) — это иерархический список (outline style), где у каждого элемента может быть вложенный список детей.
children: принимает key path (\.children), указывающий, где искать дочерние элементы.
SwiftUI автоматически создаёт раскрывающиеся секции, если у элемента есть children.
 
*/

import SwiftUI

// MARK: - Модель с вложенностью
struct Parent: Identifiable {
    var id = UUID()
    var name: String = ""
    var children: [Parent]? // Массив дочерних элементов
}

// MARK: - Основной пример
struct List_WithChildren: View {
    // Пример вложенных данных
    var parents = [
        Parent(name: "Mark", children: [
            Parent(name: "Paola")
        ]),
        Parent(name: "Rodrigo", children: [
            Parent(name: "Kai"),
            Parent(name: "Brennan"),
            Parent(name: "Easton")
        ]),
        Parent(name: "Marcella", children: [
            Parent(name: "Sam"),
            Parent(name: "Melissa"),
            Parent(name: "Melanie")
        ])
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView2(
                title: "List",
                subtitle: "Children",
                desc: "You can arrange your data to allow the List view to show it in an outline style.",
                back: .green
            )
            
            // Иерархический список
            List(parents, children: \.children) { parent in
                Text(parent.name)
                    .font(.title3)
            }
            .listStyle(.inset)
        }
        .font(.title3)
        .padding()
    }
}

#Preview {
    List_WithChildren()
}

// MARK: - Вспомогательный HeaderView для демо
struct HeaderView2: View {
    let title: String
    let subtitle: String
    let desc: String
    var back: Color = .clear
    
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
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(back.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
