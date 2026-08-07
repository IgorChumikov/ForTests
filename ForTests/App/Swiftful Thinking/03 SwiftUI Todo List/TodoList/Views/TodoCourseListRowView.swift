//
//  TodoCourseListRowView.swift
//  TodoList
//
//  Created by Nick Sarno on 3/2/21.
//

import SwiftUI

struct TodoCourseListRowView: View {
    
    let item: TodoCourseItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct TodoCourseListRowView_Previews: PreviewProvider {
    
    static var item1 = TodoCourseItemModel(title: "First item!", isCompleted: false)
    static var item2 = TodoCourseItemModel(title: "Second Item.", isCompleted: true)
    
    static var previews: some View {
        Group {
            TodoCourseListRowView(item: item1)
            TodoCourseListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
        
    }
}
