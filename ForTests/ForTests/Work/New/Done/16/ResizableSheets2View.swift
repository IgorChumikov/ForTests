//
//  SwiftUIView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 15.05.2024.
//

import SwiftUI

struct ResizableSheets2View: View {
    
    var action: () -> Void
    
    var body: some View {
        Text("Hello, World!")
        Button("Закрыть") {
            action()
        }
    }
}

#Preview {
    ResizableSheets2View(action: {})
}
