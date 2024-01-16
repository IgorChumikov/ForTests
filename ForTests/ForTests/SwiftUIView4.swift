//
//  SwiftUIView4.swift
//  ForTests
//
//  Created by Игорь Чумиков on 15.01.2024.
//

import SwiftUI

struct SwiftUIView4: View {
    @State private var scrollPosition: CGFloat = .zero {
        didSet {
            // Разница между старым и новым значением
            let difference = scrollPosition - oldValue
           // print("didSet: \(scrollPosition), разница: \(difference)")
        }
    }
    
    @State private var isScrollingDown: Bool = false
    
    @State private var gaga: CGFloat = -60
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                VStack {
                    Text("LogoPanel")
                        .padding()
                        .background(.blue)
                        .offset(y: calculateOffset(scrollPosition))
                    Text("header")
                        .padding(.horizontal, 150)
                        .background(.brown)
                }
                .padding(.top, 10)
                VStack {
                    ScrollView {
                        VStack {
                            ForEach(1...30, id: \.self) {
                                Divider().background(Color.red)
                                Text("\($0)").frame(maxWidth: .infinity)
                            }
                        }
                        .background(GeometryReader { geometry in
                            Color.clear
                                .preference(key: ScrollOffsetPreferenceKey4.self, value: geometry.frame(in: .named("scroll")).origin)
                        })
                        .onPreferenceChange(ScrollOffsetPreferenceKey4.self) { value in
                            self.scrollPosition = value.y
                        }
                    }
                    .coordinateSpace(name: "scroll")
                    .navigationTitle("Scroll offset: \(scrollPosition)")
                    
                }
                .padding(.top, 120)
                .navigationBarTitleDisplayMode(.inline)
                
            }
        }
    }
    
    private func calculateOffset(_ scrollPosition: CGFloat) -> CGFloat {
        if scrollPosition >= 0.1 {
            print("aaa")
            return 0.0
        } else if scrollPosition <= -60 {
            print("bbb")
            return gaga
        } else {
            print("ccc")
            return scrollPosition
        }
    }
}

struct ScrollOffsetPreferenceKey4: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
    }
}

#Preview {
    SwiftUIView4()
}
