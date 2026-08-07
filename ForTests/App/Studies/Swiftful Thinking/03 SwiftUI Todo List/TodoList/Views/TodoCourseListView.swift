//
//  TodoCourseListView.swift
//  TodoList
//
//  Created by Nick Sarno on 3/2/21.
//

import SwiftUI

struct TodoCourseListView: View {
    
    @EnvironmentObject var listViewModel: TodoCourseListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                TodoCourseNoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        TodoCourseListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: TodoCourseAddView())
            )
    }

}

struct TodoCourseListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodoCourseListView()
        }
        .environmentObject(TodoCourseListViewModel())
    }
}
