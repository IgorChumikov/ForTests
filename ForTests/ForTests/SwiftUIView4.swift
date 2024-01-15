//
//  SwiftUIView4.swift
//  ForTests
//
//  Created by Игорь Чумиков on 15.01.2024.
//

import SwiftUI

struct SwiftUIView4: View {
    @State private var scrollPosition: CGPoint = .zero {
        didSet {
            // Проверяем, что scrollPosition.y меньше или равен 0
            guard scrollPosition.y <= 0 else {
                return
            }
            
            // Проверяем, что scrollPosition.y увеличилось
            if oldValue.y < scrollPosition.y {
                if !isScrollingDown {
                    withAnimation(.spring().delay(0.3)) {
                        isScrollingDown = true
                    }
                }
            }
        }
        
        willSet(newValue) {
            // Сравнение старого и нового значения в willSet
            if newValue.y < scrollPosition.y {
                withAnimation(.spring().delay(0.3)) {
                    isScrollingDown = false
                }
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
                       // .opacity(isScrollingDown ? 1 : effect(scrollPosition))
                    Text("header")
                        .padding(.horizontal, 150)
                        .background(.brown)
                }
                .padding(.top, 10)
                VStack {
                    ScrollView {
                        VStack {
                            ForEach(1...100, id: \.self) {
                                Divider().background(Color.red)
                                Text("\($0)").frame(maxWidth: .infinity)
                            }
                        }
                        .background(GeometryReader { geometry in
                            Color.clear
                                .preference(key: ScrollOffsetPreferenceKey4.self, value: geometry.frame(in: .named("scroll")).origin)
                        })
                        .onPreferenceChange(ScrollOffsetPreferenceKey4.self) { value in
                            self.scrollPosition = value
                        }
                    }
                    .coordinateSpace(name: "scroll")
                    .navigationTitle("Scroll offset: \(scrollPosition.y)")
                    
                }
                .padding(.top, 120)
                .navigationBarTitleDisplayMode(.inline)
                
            }
        }
    }
    
    private func calculateOffset(_ scrollPosition: CGPoint) -> CGFloat {
        if isScrollingDown || scrollPosition.y >= 0.0 {
            return 0.0
        } else {
            return scrollPosition.y
        }
    }
    
    private func effect(_ scrollPosition: CGPoint) -> CGFloat {
        guard scrollPosition.y <= 0 || !isScrollingDown else {
            return 0.0
        }
        
        let invertedValue = 1.0 - abs(Double(scrollPosition.y)) / 100.0
        print(max(0.0, min(invertedValue, 1.0)))
        
        return max(0.0, min(invertedValue, 1.0))
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
