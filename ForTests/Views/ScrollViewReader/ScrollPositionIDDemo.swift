
//
//  ScrollPositionIDDemo.swift
//  ForTests
//
//  Created by Игорь Чумиков on 19.09.2025.
//

import SwiftUI

struct MyItem: Identifiable, Hashable {
    let id: UUID
    let title: String
}

struct ItemView: View {
    let item: MyItem

    var body: some View {
        Text(item.title)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.green.opacity(0.2))
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

struct ScrollPositionExampleCorrected: View {
    @State private var items: [MyItem] = (0..<100).map { MyItem(id: UUID(), title: "Item \($0)") }
    // idType должен совпадать с MyItem.ID, т.е. UUID.self
    @State private var position = ScrollPosition(idType: MyItem.ID.self)

    var body: some View {
        VStack(spacing: 16) {
            Button("Scroll to item 50") {
                // находим UUID элемента #50
                if items.indices.contains(50) {
                    let targetId = items[50].id
                    withAnimation {
                        position.scrollTo(id: targetId, anchor: .top)
                    }
                }
            }

            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(items) { item in
                        ItemView(item: item)
                            .id(item.id)  // важно: id должен быть здесь
                    }
                }
                .scrollTargetLayout()
            }
            .scrollPosition($position)
            .frame(height: 400)
        }
        .padding()
    }
}

#Preview {
    ScrollPositionExampleCorrected()
}
