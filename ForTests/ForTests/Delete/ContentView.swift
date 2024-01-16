//
//  ContentView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 12.01.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scrollTransitionPhase: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                Text("Now you see me")
                    .padding()
                    .background(.red)
            }
            .padding(.top, 10)
            ScrollView {
                ForEach(0..<30) { index in
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.blue)
                        .frame(height: 80)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0)
                             .scaleEffect(phase.isIdentity ? 1 : 0.75)
                             .blur(radius: phase.isIdentity ? 0 : 10)
                        }
                        .padding(.horizontal)
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
