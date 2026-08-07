//
//  SUIBootcampGroupBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Nick Sarno on 5/18/23.
//

import SwiftUI

struct SUIBootcampGroupBootcamp: View {
    var body: some View {
        VStack(spacing: 50) {
            Text("Hello, world!")
            
            Group {
                Text("Hello, world!")
                Text("Hello, world!")
            }
            .font(.caption)
            .foregroundColor(.green)
        }
        .foregroundColor(.red)
        .font(.headline)
    }
}

struct SUIBootcampGroupBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SUIBootcampGroupBootcamp()
    }
}
