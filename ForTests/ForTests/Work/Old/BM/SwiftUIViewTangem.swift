//
//  SwiftUIViewTangem.swift
//  ForTests
//
//  Created by Игорь Чумиков on 31.07.2024.
//

import SwiftUI

struct SwiftUIViewTangem: View {
   // @ObservableObject var viewModel: MainViewModel
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Text("ffffff")
                    .frame(width: geometry.size.width * 1 / 3)
                
                Text("ffffff")
//                Image()
//                    .frame(width: 60, height: 60)
            }
        }
    }
}

#Preview {
    SwiftUIViewTangem()
}
