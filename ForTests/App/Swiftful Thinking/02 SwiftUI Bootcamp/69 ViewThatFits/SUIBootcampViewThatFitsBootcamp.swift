//
//  SUIBootcampViewThatFitsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Nick Sarno on 9/18/23.
//

import SwiftUI

struct SUIBootcampViewThatFitsBootcamp: View {
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            
            ViewThatFits {
                Text("This is some text that I would like to display to the user!")
                Text("This is some text that I would like to display!")
                Text("This is some text!")
            }
        }
        .frame(height: 300)
        .padding(50)
        .font(.headline)
    }
}

struct SUIBootcampViewThatFitsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SUIBootcampViewThatFitsBootcamp()
    }
}
