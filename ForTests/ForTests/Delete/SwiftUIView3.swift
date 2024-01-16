//
//  SwiftUIView3.swift
//  ForTests
//
//  Created by Игорь Чумиков on 12.01.2024.
//

import SwiftUI

struct SwiftUIView3: View {
    @State private var scrollOffset: CGPoint = .zero
    @State private var scrollUp: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: .zero)  {
                HStack(spacing: .zero)  {
                    Text("LogoPanel")
                        .padding()
                        .background(.blue)
                        .opacity(Double(scrollOffset.y) >= 0.0 ? 1 : 0)
                   // .opacity(scrollUp ? 1 : 0)
                    
                }
                .padding(.top, 10)
                ScrollViewWithOffset(onScroll: handleScroll) {
                    LazyVStack(spacing: .zero, pinnedViews: [.sectionHeaders]) {
                        Section {
                            ForEach(1...100, id: \.self) {
                                Divider().background(Color.red)
                                Text("\($0)").frame(maxWidth: .infinity)
                            }
                        } header: {
                            Text("header")
                                .padding(.horizontal, 150)
                                .background(.brown)
                            
                        }
                    }
                }
                .navigationTitle("Offset: \(Int(scrollOffset.y))")
            }
        }
    }

    func handleScroll(_ offset: CGPoint) {
        
        if scrollOffset.y <= offset.y {
            self.scrollUp = false
        }
        print(scrollUp)
        print("scrollOffset.y: \(scrollOffset.y)")
        print("offset.y: \(offset.y)")
        
        self.scrollOffset = offset
    }
}

#Preview {
    SwiftUIView3()
}
