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
            // Проверяем, что scrollPosition.y меньше или равен 0
            guard scrollPosition <= 0 else {
                return
            }
            
            // Проверяем, что scrollPosition.y увеличилось
            if oldValue < scrollPosition {
                if !isScrollingDown {
                    isScrollingDown = true
                }
            }
        }
        
        willSet(newValue) {
            // Сравнение старого и нового значения в willSet
            if newValue < scrollPosition {
                isScrollingDown = false
            }
        }
    }
    
    @State private var isScrollingDown: Bool = false
    
    init() {
        // Изменение цвета фона навигационного бара
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .red // Замените .yourDesiredColor на цвет вашего выбора
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
        } else {
            if isScrollingDown {
                let adjustedOffset = max(-60, scrollPosition)
                print("isScrollingDown \(adjustedOffset)")
                print("isScrollingDown2 \(scrollPosition)")
                return adjustedOffset
            } else {
                let adjustedOffset = max(-60, scrollPosition + 1)
                print("isScrollingUp \(adjustedOffset)")
                print("isScrollingUp2 \(abs(Double(scrollPosition)) / 100.0)")
                return adjustedOffset
            }
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
