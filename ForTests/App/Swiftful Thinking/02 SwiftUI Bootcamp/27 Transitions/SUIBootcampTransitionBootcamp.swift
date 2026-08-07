//
//  SUIBootcampTransitionBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Nick Sarno on 1/25/21.
//

import SwiftUI

struct SUIBootcampTransitionBootcamp: View {
    
    @State var showView: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack {
                Button("BUTTON") {
                    withAnimation(.easeInOut) { // <- animation here
                        showView.toggle()
                    }
                }
                Spacer()
            }
            
            if showView {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .transition(.asymmetric(
                        insertion: .move(edge: .bottom),
                        removal: AnyTransition.opacity.animation(.easeInOut)
                    ))
            }
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SUIBootcampTransitionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SUIBootcampTransitionBootcamp()
    }
}
