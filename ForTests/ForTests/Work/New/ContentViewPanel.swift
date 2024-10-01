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
}

struct ContentViewPanel: View {
    @State private var nodes: [TreeListNode] = [
        TreeListNode(name: "Закон", children: [
            TreeListNode(name: "Глава 1", children: [
                TreeListNode(name: "Статья 1", children: [
                    TreeListNode(name: "Пункт 1.1", children: [
                        TreeListNode(name: "Подпункт 1.1.1"),
                        TreeListNode(name: "Подпункт 1.1.2")
                    ]),
                    TreeListNode(name: "Пункт 1.2")
                ]),
                TreeListNode(name: "Статья 2")
            ]),
            TreeListNode(name: "Глава 2", children: [
                TreeListNode(name: "Статья 3", children: [
                    TreeListNode(name: "Пункт 3.1"),
                    TreeListNode(name: "Пункт 3.2", children: [
                        TreeListNode(name: "Подпункт 3.2.1")
                    ])
                ])
            ])
        ]),
        TreeListNode(name: "Судебная практика", children: [
            TreeListNode(name: "Решение 1", children: [
                TreeListNode(name: "Обстоятельства дела"),
                TreeListNode(name: "Выводы суда", children: [
                    TreeListNode(name: "Пункт 1"),
                    TreeListNode(name: "Пункт 2")
                ])
            ]),
            TreeListNode(name: "Решение 2")
        ]),
    ]

    var body: some View {
        List {
            ForEach(nodes) { node in
                NodeView(node: node)
            }
        }
    }
}

struct NodeView: View {
    let node: TreeListNode
    @State private var isExpanded = false

    var body: some View {
        DisclosureGroup(
            isExpanded: $isExpanded,
            content: {
                if !node.children.isEmpty {
                    ForEach(node.children) { child in
                        NodeView(node: child)
                    }
                }
            },
            label: {
                Text(node.name)
            }
        )
    }
}

struct ContentViewPanel_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewPanel()
    }
}
