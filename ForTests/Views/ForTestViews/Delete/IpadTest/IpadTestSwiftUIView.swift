//
//  IpadTestSwiftUIView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 04.12.2024.
//

import SwiftUI

// Модель элемента списка
struct Item: Identifiable {
    var id = UUID() // уникальный идентификатор
    var text: String
    var isSelected: Bool = false // флаг для выделения элемента
}

struct IpadTestSwiftUIView: View {
    // Массив элементов, состоящих из модели Item
    @State private var items: [Item] = [
        Item(text: "Текст 1"),
        Item(text: "Текст 2"),
        Item(text: "Текст 3"),
        Item(text: "Текст 4")
    ]
    
    // Переменная для хранения индекса выбранного элемента
    @State private var selectedItemIndex: Int? = nil
    
    var body: some View {
        List($items) { $item in
            Text(item.text)
                .padding()
                .background(item.isSelected ? Color.blue : Color.clear) // Выделение фона
                .foregroundColor(item.isSelected ? Color.white : Color.black) // Цвет текста
                .cornerRadius(8)
                .onTapGesture {
                    // Устанавливаем выбранный элемент, снимая выделение с других
                    if let index = items.firstIndex(where: { $0.id == item.id }) {
                        selectedItemIndex = index
                        items = items.map { var currentItem = $0; currentItem.isSelected = false; return currentItem } // Снять выделение с других элементов
                        items[index].isSelected = true // Выделить текущий элемент
                    }
                }
        }
        .padding()
    }
}

#Preview {
    IpadTestSwiftUIView()
}
