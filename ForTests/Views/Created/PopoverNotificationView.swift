//
//  PopoverNotificationView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 19.05.2025.
//

import SwiftUI

struct PopoverNotificationView: View {

    @State private var show = false

    var body: some View {
        Button("Open Popover") {
            self.show = true
        }
        .buttonStyle(.borderedProminent)
        .popover(isPresented: self.$show,
                 attachmentAnchor: .point(.top),
                 arrowEdge: .bottom,
                 content: {
            Text("Hello, World!")
                .padding()
                .presentationCompactAdaptation(.popover)
        })
    }
}

#Preview {
    PopoverNotificationView()
}
