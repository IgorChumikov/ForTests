//
//  Navigation_BarHidden.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.10.2025.
//

/*
 
 NavigationStack (iOS 16+) позволяет скрывать или показывать навигационную панель
динамически с помощью `.toolbar(_:)`.
 
 • `.toolbar(.hidden)` — полностью скрывает навигационную панель.
 • `.toolbar(.visible)` — показывает её снова.
 
 Удобно использовать, когда нужно временно убрать навбар, например, для полноэкранного контента.
 
 */

import SwiftUI

struct Navigation_BarHidden: View {
    @State private var isHidden = false
    
    var body: some View {
        NavigationStack {
            Toggle("Hide Nav Bar", isOn: $isHidden)
                .font(.title)
                .padding()
                .toolbar(isHidden ? .hidden : .visible)
                .navigationTitle("Hide Me")
        }
    }
}

#Preview {
    Navigation_BarHidden()
}
