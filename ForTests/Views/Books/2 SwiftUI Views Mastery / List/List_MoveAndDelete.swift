//
//  List_MoveAndDelete.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.10.2025.
//

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
