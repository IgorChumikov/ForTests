//
//  DO11111123ffffff.swift
//  ForTests
//
//  Created by Игорь Чумиков on 19.11.2024.
//

import SwiftUI

struct DO11111123ffffff: View {
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                Button("Jump to #50") {
                    proxy.scrollTo(50)
                }

                List(0..<100, id: \.self) { i in
                    Text("Example \(i)")
                    .id(i)
                }
            }
        }
    }
}

#Preview {
    DO11111123ffffff()
}
