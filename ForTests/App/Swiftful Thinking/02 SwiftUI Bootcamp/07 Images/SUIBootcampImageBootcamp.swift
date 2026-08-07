//
//  SUIBootcampImageBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Nick Sarno on 1/18/21.
//

import SwiftUI

struct SUIBootcampImageBootcamp: View {
    var body: some View {
        Image("Bootcamp_google")
            //.renderingMode(.template)
            .resizable()
            //.aspectRatio(contentMode: .fit)
            //.scaledToFit()
            .scaledToFit()
            .frame(width: 300, height: 200)
            .foregroundColor(.green)
            //.clipped()
            //.cornerRadius(150)
            //.clipShape(
                //Circle()
                //RoundedRectangle(cornerRadius: 25.0)
                //Ellipse()
            //    Circle()
            //)
    }
}

struct SUIBootcampImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SUIBootcampImageBootcamp()
    }
}
