//
//  ContentViewPanel.swift
//  ForTests
//
//  Created by Игорь Чумиков on 01.10.2024.
//

import SwiftUI

struct TreeListNode: Identifiable {
    let id = UUID()
    let name: String
    var children: [TreeListNode] = []
    var collapsed: Bool = false // Флаг, указывающий, свернут ли узел
}

struct ContentViewPanel: View {
    @State private var nodes: [TreeListNode] = [
        TreeListNode(name: "Законадательство", children: [
            TreeListNode(name: "Глава 1", children: [
                TreeListNode(name: "Статья 1"),
                TreeListNode(name: "Статья 2", children: [
                    TreeListNode(name: "Статья 1 1"),
                    TreeListNode(name: "Статья 2 2")
                ])
            ]),
            TreeListNode(name: "Глава 2", children: [
                TreeListNode(name: "Статья 3"),
                TreeListNode(name: "Статья 4")
            ]),
            TreeListNode(name: "Глава 3"),
            TreeListNode(name: "Глава 4")
        ]),
        TreeListNode(name: "Судебная практика", children: [
            TreeListNode(name: "Решение 1"),
            TreeListNode(name: "Решение 2"),
            TreeListNode(name: "Решение 3"),
            TreeListNode(name: "Решение 4", children: [
                TreeListNode(name: "Решение 1"),
                TreeListNode(name: "Решение 2"),
                TreeListNode(name: "Решение 3")
            ])
        ]),
    ]
    
    var body: some View {
        List {
            ForEach($nodes) { $node in
                NodeView(node: $node)
            }
        }
    }
}

struct NodeView: View {
    @Binding var node: TreeListNode
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if !node.children.isEmpty {
                    Image(systemName: node.collapsed ? "chevron.right" : "chevron.down")
                        .onTapGesture {
                            node.collapsed.toggle()
                        }
                }
                Text(node.name)
            }
            if !node.collapsed && !node.children.isEmpty {
                ForEach($node.children) { $child in
                    NodeView(node: $child)
                        .padding(.leading, 20) // Добавляем отступ для вложенных узлов
                }
            }
        }
    }
}

struct ContentViewPanel_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewPanel()
    }
}
