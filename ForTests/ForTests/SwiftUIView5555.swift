//
//  SwiftUIView5555.swift
//  ForTests
//
//  Created by Игорь Чумиков on 15.01.2024.
//

import SwiftUI

struct SwiftUIView5555: View {
    
    let circleColors = [Color.teal, .purple, .blue, .green, .orange, .yellow, .cyan,.red, .indigo]
    
    var body: some View {
        
        ZStack {
            
            ForEach(0..<circleColors.count, id: \.self) { idx in
                
                RoundedRectangle(cornerRadius: 100)
                
                    .fill(circleColors[idx])
                
                    .frame(width: 200, height: 200)
                
                    .shadow(radius: 5)
                
                    .offset(x: CGFloat(idx) * 2.0, y: CGFloat(idx) * 20.0)
                
            }
            
        }
        
    }
    
}

#Preview {
    SwiftUIView5555()
}
