//
//  SUIBootcampColorsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Nick Sarno on 1/15/21.
//

import SwiftUI

struct SUIBootcampColorsBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
                //Color.primary
                //Color(#colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1))
                //Color(UIColor.secondarySystemBackground)
                Color("Bootcamp_CustomColor")
            )
            .frame(width: 300, height: 200)
            //.shadow(radius: 10)
            .shadow(color: Color("Bootcamp_CustomColor").opacity(0.3), radius: 10, x: -20, y: -20)
    }
}

struct SUIBootcampColorsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SUIBootcampColorsBootcamp()
            
            
            
    }
}
