//
//  GoogleIpadSwiftUIView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 04.12.2024.
//

import SwiftUI

// Модель секции
struct SmartDocsSectionSheet: Identifiable {
    let id = UUID()
    let treeUID: String
    let name: String
    var children: [SmartDocsSectionSheet] = []
    var collapsed: Bool = false
    var number: String = "0"
    var numberTotal: String = "0"
    var mainNode: Bool = false
    var isSelected: Bool = false
    var nestingLevel: Int
    var isDocumentLinkAvailable: Bool = false
}

class SmartDocsViewModel: ObservableObject {
    @Published var nodes: [SmartDocsSectionSheet] = [
        SmartDocsSectionSheet(treeUID: "1", name: "Секция 1", nestingLevel: 1),
        SmartDocsSectionSheet(treeUID: "2", name: "Секция 2", children: [
            SmartDocsSectionSheet(treeUID: "2.1", name: "Дочерняя секция 1", nestingLevel: 2),
            SmartDocsSectionSheet(treeUID: "2.2", name: "Дочерняя секция 2", nestingLevel: 2)
        ], nestingLevel: 1),
        SmartDocsSectionSheet(treeUID: "3", name: "Секция 3", nestingLevel: 1)
    ]
    
    // Рекурсивная функция для сброса выделения
    private func deselectAll(in nodes: [SmartDocsSectionSheet]) -> [SmartDocsSectionSheet] {
        nodes.map { node in
            var updatedNode = node
            updatedNode.isSelected = false
            updatedNode.children = deselectAll(in: updatedNode.children)
            return updatedNode
        }
    }
    
    // Рекурсивная функция для выделения узла
    private func selectNode(_ treeUID: String, in nodes: [SmartDocsSectionSheet]) -> [SmartDocsSectionSheet] {
        nodes.map { node in
            var updatedNode = node
            if updatedNode.treeUID == treeUID {
                updatedNode.isSelected = true
            } else {
                updatedNode.children = selectNode(treeUID, in: updatedNode.children)
            }
            return updatedNode
        }
    }
    
    // Функция для выделения одного узла
    func selectNode(_ nodeToSelect: SmartDocsSectionSheet) {
        // Сбросить все выделения
        nodes = deselectAll(in: nodes)
        // Выделить новый узел
        nodes = selectNode(nodeToSelect.treeUID, in: nodes)
    }
}

struct GoogleIpadSwiftUIView: View {
    @StateObject var viewModel = SmartDocsViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.nodes) { section in
                SectionView(section: section, onSelect: viewModel.selectNode)
            }
        }
        .padding()
    }
}

struct SectionView: View {
    var section: SmartDocsSectionSheet
    var onSelect: (SmartDocsSectionSheet) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(section.name)
                .padding()
                .background(section.isSelected ? Color.blue : Color.clear)
                .foregroundColor(section.isSelected ? Color.white : Color.black)
                .cornerRadius(8)
                .onTapGesture {
                    onSelect(section)
                }
            
            // Отображение дочерних секций
            if !section.children.isEmpty {
                ForEach(section.children) { child in
                    SectionView(section: child, onSelect: onSelect)
                        .padding(.leading, 20) // Добавляем отступ для вложенности
                }
            }
        }
    }
}

#Preview {
    GoogleIpadSwiftUIView()
}
