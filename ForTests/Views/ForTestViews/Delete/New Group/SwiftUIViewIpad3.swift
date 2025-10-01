//
//  SwiftUIViewIpad3.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.10.2024.
//

import SwiftUI

struct SwiftUIViewIpad3: View {
    var body: some View {
        ZStack {
            List {
                ForEach(0..<10) { index in
                    Text("Item \(index)")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            List {
                ForEach(10..<20) { index in
                    Text("Item \(index)")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .offset(x: 200, y: 0) // Смещение второго списка
        }
        .navigationTitle("Two Lists")
    }
}

#Preview {
    SwiftUIViewIpad3()
}
