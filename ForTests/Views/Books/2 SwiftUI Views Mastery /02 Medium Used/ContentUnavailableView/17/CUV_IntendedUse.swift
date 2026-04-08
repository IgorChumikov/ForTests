//
//  CUV_IntendedUse.swift
//  ForTests
//
//  Created by Игорь Чумиков on 01.10.2025.
//

/*
 ContentUnavailableView — правильное использование для пустых состояний (iOS 17+)

 • Рекомендуемый Apple способ отображения экранов, когда данные отсутствуют.
 • Поддерживает label, description и actions для создания понятного UX.
 • Отлично подходит для пустых списков, отсутствующих результатов поиска и начальных экранов.
 • Можно добавлять кнопки действий (например, «Добавить») для вовлечения пользователя.
 */

import SwiftUI

struct CUV_IntendedUse: View {
    @State private var tags: [String] = []

    var body: some View {
        if tags.isEmpty {
            ContentUnavailableView {
                Label("No Tags", systemImage: "tag.fill")
            } description: {
                Text("You don't have any tags yet.\nAdd a new tag today to get started!")
            } actions: {
                Button {
                    tags.append("Switzerland")
                } label: {
                    Text("Add Tag")
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
            }
        } else {
            List(tags, id: \.self) { tag in
                Text(tag)
            }
        }
    }
}

#Preview {
    CUV_IntendedUse()
}
