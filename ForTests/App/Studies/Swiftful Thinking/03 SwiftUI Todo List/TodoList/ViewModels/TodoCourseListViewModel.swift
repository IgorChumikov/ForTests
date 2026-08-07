//
//  TodoCourseListViewModel.swift
//  TodoList
//
//  Created by Nick Sarno on 3/3/21.
//

import Foundation

/*
 CRUD FUNCTIONS:
 
 Create
 Read
 Update
 Delete
 */

class TodoCourseListViewModel: ObservableObject {
    
    @Published var items: [TodoCourseItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([TodoCourseItemModel].self, from: data)
        else { return }

        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = TodoCourseItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: TodoCourseItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
