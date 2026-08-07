//
//  SUIBootcampColorPickerBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Nick Sarno on 2/5/21.
//

import SwiftUI

struct SUIBootcampColorPickerBootcamp: View {
    
    @State var backgroundColor: Color = .green
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            ColorPicker("Select a color",
                        selection: $backgroundColor,
                        supportsOpacity: true)
                .padding()
                .background(Color.black)
                .cornerRadius(10)
                .foregroundColor(.white)
                .font(.headline)
                .padding(50)
        }
        
    }
}

struct SUIBootcampColorPickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SUIBootcampColorPickerBootcamp()
    }
}
