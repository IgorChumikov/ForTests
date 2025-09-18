//
//  ScrollViewReaderText.swift
//  ForTests
//
//  Created by Игорь Чумиков on 18.09.2025.
//

import SwiftUI

struct ScrollViewReaderText: View {
    @State private var yOffset: Double = 0.0

    var body: some View {
        VStack {
            ScrollView {
                ForEach(0..<100, id: \.self) { i in
                    Text("Row \(i)")
                        .frame(height: 50) // Example height for content
                }
            }
            .onScrollGeometryChange(for: Double.self) { geometry in
                geometry.contentOffset.y
            } action: { oldValue, newValue in
                yOffset = newValue
            }
            
            Text("Current Y Offset: \(yOffset, specifier: "%.2f")")
        }
    }
}

#Preview {
    ScrollViewReaderText()
}
