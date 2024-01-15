//
//  SwiftUIView5.swift
//  ForTests
//
//  Created by Игорь Чумиков on 15.01.2024.
//

import SwiftUI

struct SwiftUIView5: View {
    @State private var scrollPosition: CGPoint = .zero
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("LogoPanel")
                        .padding()
                        .background(.blue)
                        .offset(y: mathOffset(scrollPosition))
                }
                .padding(.top, 10)
                
                ScrollView {
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
                    .background(GeometryReader { geometry in
                        Color.clear
                            .preference(key: ScrollOffsetPreferenceKey3.self, value: geometry.frame(in: .named("scroll")).origin)
                    })
                    .onPreferenceChange(ScrollOffsetPreferenceKey3.self) { value in
                        self.scrollPosition = value
                    }
                }
                .coordinateSpace(name: "scroll")
                .navigationTitle("Scroll offset: \(scrollPosition.y)")
                
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func mathOffset(_ scrollPosition: CGPoint) -> CGFloat {
        return scrollPosition.y
    }
}


struct ScrollOffsetPreferenceKey3: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}

#Preview {
    SwiftUIView5()
}
