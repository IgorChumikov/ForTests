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
    var number: String = "100"
    var mainNode: Bool = false
}

struct ContentViewPanel: View {
    @State private var nodes: [TreeListNode] = [
        TreeListNode(name: "Законадательство", children: [
            TreeListNode(name: "Российское законодательства (Версия Проф)"),
            TreeListNode(name: "Практика антимонопольной службы"),
            TreeListNode(name: "Решения госорганов по спорным ситуациям"),
            TreeListNode(name: "Эксперт-приложение 9бюджетные организации")
            
        ], mainNode: true),
        TreeListNode(name: "Судебная практика", children: [
            TreeListNode(name: "Решение 1"),
            TreeListNode(name: "Решение 2"),
            TreeListNode(name: "Решение 3"),
            TreeListNode(name: "Решение 4", children: [
                TreeListNode(name: "Решение 1"),
                TreeListNode(name: "Решение 2"),
                TreeListNode(name: "Решение 3")
            ],mainNode: true)
        ], mainNode: true),
        TreeListNode(name: "Законадательство", children: [
            TreeListNode(name: "Российское законодательства (Версия Проф)"),
            TreeListNode(name: "Практика антимонопольной службы"),
            TreeListNode(name: "Решения госорганов по спорным ситуациям"),
            TreeListNode(name: "Эксперт-приложение 9бюджетные организации")
            
        ], mainNode: true),
        TreeListNode(name: "Судебная практика", children: [
            TreeListNode(name: "Решение 1"),
            TreeListNode(name: "Решение 2"),
            TreeListNode(name: "Решение 3"),
            TreeListNode(name: "Решение 4", children: [
                TreeListNode(name: "Решение 1"),
                TreeListNode(name: "Решение 2"),
                TreeListNode(name: "Решение 3")
            ], mainNode: true)
        ], mainNode: true),
    ]
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Разделы")
                .bold()
                .padding(.bottom, 10)
            Divider()
                .background(Color.red)
                .frame(height: 5)
            List {
                ForEach($nodes) { $node in
                    NodeView(node: $node)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.inset)
            
            Button {
                // some code
            } label: {
                Image(systemName: "chevron.down")
            }
            .padding(16)
        }
    }
}

struct NodeView: View {
    @Binding var node: TreeListNode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top, spacing: 5) {
                if !node.children.isEmpty {
                    Image(systemName: node.collapsed ? "chevron.right" : "chevron.down")
                        .onTapGesture {
                            node.collapsed.toggle()
                        }
                }
                Text(node.name)
                Spacer()
                Button {
                    // some code
                } label: {
                    Text(node.number)
                        .foregroundColor(.gray)
                }
                .hidden(!node.collapsed && node.mainNode , mode: .removed)
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
