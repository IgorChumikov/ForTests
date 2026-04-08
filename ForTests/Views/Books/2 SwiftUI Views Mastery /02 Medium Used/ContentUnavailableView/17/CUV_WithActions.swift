//
//  CUV_WithActions.swift
//  ForTests
//
//  Created by Игорь Чумиков on 01.10.2025.
//

/*
 ContentUnavailableView — экран пустого состояния с действиями (iOS 17+)

 • Позволяет показывать красиво оформленный экран пустого состояния.
 • Поддерживает label, description и отдельный блок actions.
 • В actions можно добавлять кнопки — отмена, удаление, повторить, и т.п.
 • Идеально подходит для подтверждений, ошибок и пустых списков.
 */


import SwiftUI

struct CUV_WithActions: View {
    var body: some View {
        ContentUnavailableView(
            label: {
                Label("Are you sure?", systemImage: "questionmark.circle.fill")
            },
            description: {
                Text("This action will permanently delete the item.")
            },
            actions: {
                HStack(spacing: 24) {
                    Button("Cancel", role: .cancel, action: {})
                    Button("Delete", role: .destructive, action: {})
                        .buttonStyle(.borderedProminent)
                }
                .fixedSize()
                .controlSize(.regular)
            }
        )
    }
}

#Preview {
    CUV_WithActions()
}
