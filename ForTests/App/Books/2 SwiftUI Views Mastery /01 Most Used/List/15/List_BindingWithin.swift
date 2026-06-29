//
//  List_BindingWithin.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.10.2025.
//

/*
 List($items) — современный способ редактировать данные прямо в списке (iOS 15+)

 • Новый синтаксис позволяет передавать в List массив Binding-объектов.
   SwiftUI сам создаёт поэлементные биндинги ($item), убирая необходимость вручную
   искать индекс или синхронизировать изменения через ViewModel.

 • Внутри List можно напрямую использовать $item.task, $item.done и другие свойства —
   TextField, Toggle, Picker и любые контролы будут изменять массив по месту.

 • Делает код чище, короче и безопаснее: никакой работы с индексами, no force unwrap,
   никакого риска рассинхронизации.

 • Отлично подходит для редактируемых списков:
      — to-do списки,
      — формы,
      — настройки,
      — чекбоксы,
      — интерактивные таблицы.
 */


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
