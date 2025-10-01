//
//  StackoverflowSwiftUIView2.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.01.2024.
//

import SwiftUI

@available(iOS 17.0, *)
struct StackoverflowSwiftUIView2: View {
    
    @State private var showingHeader = true
    @State private var turningPoint: CGFloat = 0 // Добавлено
    let thresholdScrollDistance: CGFloat = 50 // Добавлено

    var body: some View {
        VStack {
            if showingHeader {
                Text("LogoPanel")
                    .padding()
                    .background(.blue)
                    .transition(
                        .asymmetric(
                            insertion: .push(from: .top),
                            removal: .push(from: .bottom)
                        )
                    )
            }
            GeometryReader { outer in
                let outerHeight = outer.size.height
                ScrollView(.vertical) {
                    ForEach(1...30, id: \.self) {
                        Divider().background(Color.red)
                        Text("\($0)").frame(maxWidth: .infinity)
                    }
                    .background {
                        GeometryReader { proxy in
                            let contentHeight = proxy.size.height
                            let minY = max(
                                min(0, proxy.frame(in: .named("ScrollView")).minY),
                                outerHeight - contentHeight
                            )
                            Color.clear
                                .onChange(of: minY) { oldVal, newVal in
                                    if (showingHeader && newVal > oldVal) || (!showingHeader && newVal < oldVal) {
                                        turningPoint = newVal
                                    }
                                    if (showingHeader && turningPoint > newVal) ||
                                        (!showingHeader && (newVal - turningPoint) > thresholdScrollDistance) {
                                        showingHeader = newVal > turningPoint
                                    }
                                }
                        }
                    }
                }
                .coordinateSpace(name: "ScrollView")
            }
            // Prevent scrolling into the safe area
            .padding(.top, 1)
        }
        .background(.white)
        .animation(.easeInOut, value: showingHeader)
    }
}

@available(iOS 17.0, *)
#Preview {
    StackoverflowSwiftUIView2()
}
