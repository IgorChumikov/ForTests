//
//  SUIBootcampExtractSubviewsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Nick Sarno on 1/21/21.
//

import SwiftUI

struct SUIBootcampExtractSubviewsBootcamp: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)).edgesIgnoringSafeArea(.all)
            
            
            contentLayer
        }
    }
    
    var contentLayer: some View {
        HStack {
            SUIBootcampMyItem(title: "Apples", count: 1, color: .red)
            SUIBootcampMyItem(title: "Oranges", count: 10, color: .orange)
            SUIBootcampMyItem(title: "Bananas", count: 34, color: .yellow)
        }
    }
    
}

struct SUIBootcampExtractSubviewsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SUIBootcampExtractSubviewsBootcamp()
    }
}

struct SUIBootcampMyItem: View {
    
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack {
            Text("\(count)")
            Text(title)
        }
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}
