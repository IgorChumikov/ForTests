//
//  SwiftUIViewPopoverVisibleswift.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.05.2025.
//

import SwiftUI

@available(iOS 18.0, *)
struct SwiftUIViewPopoverVisibleswift: View {
    @State private var isPopoverVisible = false

    var body: some View {
        Button("Показать popover") {
            isPopoverVisible = true
        }
        .popover(isPresented: $isPopoverVisible, attachmentAnchor: .rect(.bounds), arrowEdge: .bottom) {
            Text("Контент поповера")
                .padding()
                .presentationCompactAdaptation(.popover)
        }
    }
}

@available(iOS 18.0, *)
#Preview {
    SwiftUIViewPopoverVisibleswift()
}
