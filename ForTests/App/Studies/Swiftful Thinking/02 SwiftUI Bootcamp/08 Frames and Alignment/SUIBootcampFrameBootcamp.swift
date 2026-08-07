//
//  SUIBootcampFrameBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Nick Sarno on 1/18/21.
//

import SwiftUI

struct SUIBootcampFrameBootcamp: View {
    var body: some View {
        Text("Hello, World!")
            .background(Color.red)
            .frame(height: 100, alignment: .top)
            .background(Color.orange)
            .frame(width: 150)
            .background(Color.purple)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.pink)
            .frame(height: 400)
            .background(Color.green)
            .frame(maxHeight: .infinity, alignment: .top)
            .background(Color.yellow)
    }
}

struct SUIBootcampFrameBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SUIBootcampFrameBootcamp()
    }
}
