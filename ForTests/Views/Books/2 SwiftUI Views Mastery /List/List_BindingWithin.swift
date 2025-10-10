//
//  List_BindingWithin.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.10.2025.
//

// IOS 15
// Модификатор List($items) — это новая, современная форма работы с List, которая позволяет редактировать данные напрямую в списке, без промежуточных ViewModel и без ручного синхрона индексов.

import SwiftUI

// MARK: - Модель данных
struct ToDoItem: Identifiable {
    let id = UUID()
    var task = ""
    var priority = false
    var done = false
}

// MARK: - Основное представление
struct List_BindingWithin: View {
    @State private var items = [
        ToDoItem(task: "Get milk", done: false),
        ToDoItem(task: "Wash car", done: true),
        ToDoItem(task: "Cut grass", done: false)
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderViewBinding(
                title: "List",
                subtitle: "Binding Within",
                desc: "You can now bind list data directly to controls in list rows."
            )
            
            // 📋 Новый синтаксис: List с биндингом
            List($items) { $item in
                HStack {
                    TextField("Task", text: $item.task)
                        .textFieldStyle(.roundedBorder)
                    
                    Toggle("Done?", isOn: $item.done)
                        .labelsHidden()
                }
            }
        }
        .font(.title3)
        .padding()
    }
}

// MARK: - Вспомогательный HeaderView
struct HeaderViewBinding: View {
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
    List_BindingWithin()
}
