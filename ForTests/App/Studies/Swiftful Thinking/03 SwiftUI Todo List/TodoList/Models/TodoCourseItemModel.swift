//
//  TodoCourseItemModel.swift
//  TodoList
//
//  Created by Nick Sarno on 3/2/21.
//

import Foundation

// Immutable Struct has only 'let' constants
struct TodoCourseItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> TodoCourseItemModel {
        return TodoCourseItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}

