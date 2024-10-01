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
            TreeListNode(name: "Российское законодательства (Версия Проф)"),
            TreeListNode(name: "Практика антимонопольной службы"),
            TreeListNode(name: "Решения госорганов по спорным ситуациям"),
            TreeListNode(name: "Эксперт-приложение 9бюджетные организации")
       
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
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.inset)
        
    }
}

struct NodeView: View {
    @Binding var node: TreeListNode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .center, spacing: 2) {
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
                        .padding(.leading, 40) // Добавляем отступ для вложенных узлов
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
