//
//  SwiftUIViewIpad2.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.10.2024.
//

import SwiftUI

struct SwiftUIViewIpad2: View {
    var body: some View {
        VStack {
            List {
                ForEach(0..<10) { index in
                    Text("Item \(index)")
                }
            }
            .frame(maxHeight: .infinity)
            
            List {
                ForEach(10..<20) { index in
                    Text("Item \(index)")
                }
            }
            .frame(maxHeight: .infinity)
        }
        .navigationTitle("Two Lists")
    }
}

#Preview {
    SwiftUIViewIpad2()
}
