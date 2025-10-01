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
    var isSelected: Bool = false
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
             ScrollView {  // Используем ScrollView вместо List для кастомизации
                 VStack(alignment: .leading, spacing: 0) {
                     ForEach($nodes) { $node in
                         DocumentsListSectionView(node: $node)
                             .padding(8)
                             .background(Color.white)  // Фон для каждой ячейки
                             .cornerRadius(8)
                             //.shadow(radius: 1)
                             .padding(.bottom, 4)
                     }
                 }
                 .padding(.horizontal, 16)
             }
         }
     }
 
}

struct DocumentsListSectionView: View {
    @Binding var node: TreeListNodeTest
    let level: Int
    
    init(node: Binding<TreeListNodeTest>, level: Int = 0) {
        self._node = node
        self.level = level
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 5) {
                HStack(spacing: 0) {
                    ForEach(0..<level, id: \.self) { _ in
                        Color.clear.frame(width: 30)
                    }
                    if !node.children.isEmpty {
                        Image(systemName: node.collapsed ? "chevron.right" : "chevron.down")
                            .frame(width: 20, height: 20)
                            .onTapGesture {
                                node.collapsed.toggle()
                            }
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
                .hidden(!node.collapsed && node.mainNode, mode: .removed)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 5)
            .background(node.isSelected ? Color.blue : Color.white)
            .onTapGesture {
                node.isSelected.toggle()
            }
            
            if !node.collapsed && !node.children.isEmpty {
                ForEach($node.children) { $child in
                    DocumentsListSectionView(node: $child, level: level + 1)
                }
            }
        }
    }
}

#Preview {
    ScrollView {
        DocumentsListSectionView(
            node:.constant(TreeListNodeTest(
                name: "Законадательство",
                children: [
                    TreeListNodeTest(name: "Российское законодательства (Версия Проф)"),
                    TreeListNodeTest(name: "Практика антимонопольной службы"),
                    TreeListNodeTest(name: "Решения госорганов по спорным ситуациям"),
                    TreeListNodeTest(name: "Эксперт-приложение 9бюджетные организации")
                ]
                , mainNode: true)
            )
        )
    }
}





struct DocumentsListSectionsPanelView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentsListSectionsPanelView()
    }
}
