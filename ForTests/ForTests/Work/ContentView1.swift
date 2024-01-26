//
//  ContentView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 26.01.2024.
//

import SwiftUI

struct ContentView1: View {
    @State private var isHidden = false
    @State private var lastOffset: CGFloat = 0

    var body: some View {
        VStack {
            ScrollView {
                // Your scrollable content goes here

                // For example, a simple list
                ForEach(0..<20) { index in
                    Text("Item \(index)")
                        .frame(height: 50)
                }
            }
            .offset(y: isHidden ? UIScreen.main.bounds.height : 0)
            .gesture(DragGesture().onChanged { value in
                onScrollChange(value)
            })

            // Your persistent view that hides/shows
            Text("Your Hidden View")
                .frame(height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .animation(.easeInOut)
                .offset(y: isHidden ? -UIScreen.main.bounds.height : 0)
        }
    }

    private func onScrollChange(_ value: DragGesture.Value) {
        let currentOffset = value.translation.height

        if currentOffset > lastOffset {
            // Scrolling down
            withAnimation {
                isHidden = true
            }
        } else {
            // Scrolling up
            withAnimation {
                isHidden = false
            }
        }

        lastOffset = currentOffset
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}

