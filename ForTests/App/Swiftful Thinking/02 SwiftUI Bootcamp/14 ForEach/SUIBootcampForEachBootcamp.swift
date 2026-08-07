//
//  SUIBootcampForEachBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Nick Sarno on 1/20/21.
//

import SwiftUI

struct SUIBootcampForEachBootcamp: View {
    
    let data: [String] = ["Hi", "Hello", "Hey everyone"]
    let myString: String = "Hello"
    
    var body: some View {
        VStack {
            ForEach(data.indices) { index in
                Text("\(data[index]): \(index)")
            }
            ForEach(0..<100) { index in
                Circle()
                    .frame(height: 50)
            }
        }
    }
}

struct SUIBootcampForEachBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SUIBootcampForEachBootcamp()
    }
}
