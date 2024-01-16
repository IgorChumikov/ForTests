//
//  StackoverflowSwiftUIView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.01.2024.
//
// https://stackoverflow.com/questions/77726256/hide-swiftui-view-when-scrollview-scrolled-down-then-show-it-again-if-scrolled



import SwiftUI

struct StackoverflowSwiftUIView: View {
    
    @State private var showingHeader = true
    
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
                                        if (showingHeader && newVal < oldVal) || !showingHeader && newVal > oldVal {
                                            showingHeader = newVal > oldVal
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
        .background(.black)
        .animation(.easeInOut, value: showingHeader)
    }
}

#Preview {
    StackoverflowSwiftUIView()
}
