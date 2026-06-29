//
//  List_ListRowInsets.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.10.2025.
//

/*
 listRowInsets — управление отступами строк List (iOS 13+)

 • Позволяет переопределять системные отступы для каждой строки списка.
 • Полезно, когда нужно сместить контент вправо/влево, создать иерархию,
   имитировать вложенные элементы или визуально сгруппировать данные.
 • Принимает EdgeInsets, позволяя задавать отступы top/leading/bottom/trailing вручную.
 • Отступы по умолчанию различаются между iOS, iPadOS и macOS,
   поэтому listRowInsets даёт полный контроль над layout.
 */


import SwiftUI

// Простая модель задачи
struct Todo: Identifiable {
    let id = UUID()
    var action: String
    var due: String = ""
    var isIndented: Bool = false
}

struct List_ListRowInsets: View {
    @State private var newToDo = ""
    @State private var data = [
        Todo(action: "Practice using List Row Insets", due: "Today"),
        Todo(action: "Grocery shopping", due: "Today"),
        Todo(action: "Vegetables", due: "Today", isIndented: true),
        Todo(action: "Spices", due: "Today", isIndented: true),
        Todo(action: "Cook dinner", due: "Next Week"),
        Todo(action: "Paint room", due: "Next Week")
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                // Заголовок
                Text("To Do")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.black)
                
                // Поле ввода нового дела
                HStack {
                    TextField("New To-Do", text: $newToDo)
                        .textFieldStyle(.roundedBorder)
                    
                    Button {
                        guard !newToDo.isEmpty else { return }
                        data.append(Todo(action: newToDo, due: "Anytime"))
                        newToDo = ""
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                    .tint(.black)
                }
                .padding(.horizontal)
                
                // Сам список
                List {
                    ForEach(data) { todo in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(todo.action)
                                .font(.title3)
                            if !todo.due.isEmpty {
                                Text(todo.due)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                        // Важно: настраиваем отступ слева динамически
                        .listRowInsets(
                            EdgeInsets(
                                top: 4,
                                leading: todo.isIndented ? 60 : 20,
                                bottom: 4,
                                trailing: 16
                            )
                        )
                    }
                }
                .listStyle(.plain)
            }
            .padding()
            .background(Color.green.opacity(0.2))
            .navigationTitle("List Row Insets")
        }
    }
}

#Preview {
    List_ListRowInsets()
}
