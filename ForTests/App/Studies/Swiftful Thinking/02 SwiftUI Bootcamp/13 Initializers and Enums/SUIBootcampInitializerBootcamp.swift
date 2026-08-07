//
//  SUIBootcampInitializerBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Nick Sarno on 1/20/21.
//

import SwiftUI

struct SUIBootcampInitializerBootcamp: View {
    
    let backgroundColor: Color
    let count: Int
    let title: String
    
    init(count: Int, fruit: SUIBootcampFruit) {
        self.count = count
        
        if fruit == .apple {
            self.title = "Apples"
            self.backgroundColor = .red
        } else {
            self.title = "Oranges"
            self.backgroundColor = .orange
        }
    }
    
    enum SUIBootcampFruit {
        case apple
        case orange
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("\(count)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .underline()
            
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 150)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

struct SUIBootcampInitializerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            SUIBootcampInitializerBootcamp(count: 100, fruit: .apple)
            SUIBootcampInitializerBootcamp(count: 46, fruit: .orange)
        }
    }
}
