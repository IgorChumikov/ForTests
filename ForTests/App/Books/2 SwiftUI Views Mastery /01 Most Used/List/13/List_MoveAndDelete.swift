//
//  List_MoveAndDelete.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.10.2025.
//

/*
 List — перемещение и удаление строк (iOS 13+ / дополнительные блокировки — iOS 15+)

 • onMove и onDelete позволяют реализовать стандартные действия списка:
      – перетаскивание строк (reordering)
      – удаление элементов свайпом или через Edit mode.
 • moveDisabled / deleteDisabled (iOS 15+) дают тонкий контроль —
   можно запретить перемещение или удаление отдельных строк.
 • EditButton автоматически включает режим редактирования списка.
 • List внутри NavigationStack получает нативные свайпы и управление анимациями.
 • Удобно для задач, чек-листов, плейлистов, сортируемых и редактируемых списков.
 */


import SwiftUI

struct List_MoveAndDelete: View {
    @State private var data = [
        "Practice Coding",
        "Grocery shopping",
        "Get tickets",
        "Clean house",
        "Do laundry",
        "Cook dinner",
        "Paint room"
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section("To Do") {
                    ForEach(data, id: \.self) { item in
                        Text(item)
                            .font(.title3)
                            .padding(.vertical, 6)
                            // 🔒 запрет на перемещение и удаление для конкретного элемента
                            .moveDisabled(item == "Clean house")
                            .deleteDisabled(item == "Clean house")
                    }
                    // ✋ перемещение строк
                    .onMove { source, destination in
                        data.move(fromOffsets: source, toOffset: destination)
                    }
                    // 🗑️ удаление строк
                    .onDelete { offsets in
                        data.remove(atOffsets: offsets)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("To Do")
            .toolbar {
                // Кнопка Edit позволяет включить режим перемещения/удаления
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            .tint(.green) // изменяет цвет кнопки Edit
        }
    }
}

#Preview {
    List_MoveAndDelete()
}
