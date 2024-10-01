//
//  DocumentsListSectionsPanelView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 01.10.2024.
//

import SwiftUI

struct TreeListNodeTest: Identifiable {
    let id = UUID()
    let name: String
    var children: [TreeListNodeTest] = []
    var collapsed: Bool = false // Флаг, указывающий, свернут ли узел
    var number: String = "100"
    var mainNode: Bool = false
}

struct DocumentsListSectionsPanelView: View {
    @State private var nodes: [TreeListNodeTest] = [
        TreeListNodeTest(name: "Законадательство", children: [
            TreeListNodeTest(name: "Российское законодательства (Версия Проф)"),
            TreeListNodeTest(name: "Практика антимонопольной службы"),
            TreeListNodeTest(name: "Решения госорганов по спорным ситуациям"),
            TreeListNodeTest(name: "Эксперт-приложение 9бюджетные организации")
            
        ], mainNode: true),
        TreeListNodeTest(name: "Судебная практика", children: [
            TreeListNodeTest(name: "Решение 1"),
            TreeListNodeTest(name: "Решение 2"),
            TreeListNodeTest(name: "Решение 3"),
            TreeListNodeTest(name: "Решение 4", children: [
                TreeListNodeTest(name: "Решение 1"),
                TreeListNodeTest(name: "Решение 2"),
                TreeListNodeTest(name: "Решение 3")
            ],mainNode: true)
        ], mainNode: true),
        TreeListNodeTest(name: "Законадательство", children: [
            TreeListNodeTest(name: "Российское законодательства (Версия Проф)"),
            TreeListNodeTest(name: "Практика антимонопольной службы"),
            TreeListNodeTest(name: "Решения госорганов по спорным ситуациям"),
            TreeListNodeTest(name: "Эксперт-приложение 9бюджетные организации")
            
        ], mainNode: true),
        TreeListNodeTest(name: "Судебная практика", children: [
            TreeListNodeTest(name: "Решение 1"),
            TreeListNodeTest(name: "Решение 2"),
            TreeListNodeTest(name: "Решение 3"),
            TreeListNodeTest(name: "Решение 4", children: [
                TreeListNodeTest(name: "Решение 1"),
                TreeListNodeTest(name: "Решение 2"),
                TreeListNodeTest(name: "Решение 3")
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
    @Binding var node: TreeListNodeTest
    
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

struct DocumentsListSectionsPanelView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentsListSectionsPanelView()
    }
}
