//
//  CUV_WithActions.swift
//  ForTests
//
//  Created by Игорь Чумиков on 01.10.2025.
//

// Этот пример как раз показывает ещё одну фишку ContentUnavailableView в iOS 17 — поддержку действий (actions).

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
