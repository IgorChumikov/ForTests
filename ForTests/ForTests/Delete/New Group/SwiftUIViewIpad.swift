//
//  SwiftUIViewIpad.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.10.2024.
//

import SwiftUI

struct SwiftUIViewIpad: View {
    
    @State var isPresented: Bool = false
    
    var body: some View {
        HStack {
                List {
                    ForEach(0..<10) { index in
                        Text("Item \(index)")
                    }
                }
                .frame(maxWidth: 200)
                
                List {
                    ForEach(10..<20) { index in
                        Text("Item \(index)")
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .navigationTitle("Two Lists")
        }
    
}

#Preview {
    SwiftUIViewIpad()
}
