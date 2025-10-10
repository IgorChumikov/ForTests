//
//  HierarchicalListDemo.swift
//  ForTests
//
//  Created by Игорь Чумиков on 10.10.2025.
//

import SwiftUI

struct NodeItem: Identifiable {
    var id = UUID()
    var name: String
    var children: [NodeItem]? = nil
}

struct DeepHierarchicalList: View {
    var items: [NodeItem] = [
        NodeItem(name: "Mark", children: [
            NodeItem(name: "Paola", children: [
                NodeItem(name: "Lucas", children: [
                    NodeItem(name: "Mia", children: [
                        NodeItem(name: "Olivia", children: [
                            NodeItem(name: "Sophia", children: [
                                NodeItem(name: "Grace"),
                                NodeItem(name: "Isabella")
                            ])
                        ])
                    ]),
                    NodeItem(name: "Leo")
                ])
            ])
        ]),
        NodeItem(name: "Rodrigo", children: [
            NodeItem(name: "Kai"),
            NodeItem(name: "Brennan", children: [
                NodeItem(name: "Sophie"),
                NodeItem(name: "Noah", children: [
                    NodeItem(name: "Eleanor", children: [
                        NodeItem(name: "Lucy", children: [
                            NodeItem(name: "Amelia")
                        ])
                    ])
                ])
            ]),
            NodeItem(name: "Easton")
        ]),
        NodeItem(name: "Marcella", children: [
            NodeItem(name: "Sam"),
            NodeItem(name: "Melissa", children: [
                NodeItem(name: "Nora"),
                NodeItem(name: "Ethan", children: [
                    NodeItem(name: "Ava", children: [
                        NodeItem(name: "Liam", children: [
                            NodeItem(name: "Jack")
                        ])
                    ]),
                    NodeItem(name: "Noel")
                ])
            ]),
            NodeItem(name: "Melanie")
        ])
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Deep Hierarchical List")
                    .font(.largeTitle.bold())
                    .padding(.top)
                
                List(items, children: \.children) { node in
                    Label(node.name, systemImage: node.children == nil ? "person.fill" : "folder.fill")
                        .font(.title3)
                }
                .listStyle(.inset)
            }
            .padding()
        }
    }
}

#Preview {
    DeepHierarchicalList()
}


// MARK: - Универсальный заголовок
struct DemoHeaderView: View {
    let title: String
    let subtitle: String
    let desc: String
    var back: Color = .clear
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.largeTitle).bold()
            Text(subtitle)
                .font(.headline)
                .foregroundStyle(.secondary)
            Text(desc)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(back.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
