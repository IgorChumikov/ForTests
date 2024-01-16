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
            print("didSet: Old Value: \(Int(oldValue.y)), New Value: \(Int(scrollPosition.y))")
            
            // Проверяем, что scrollPosition.y меньше или равен 0
            guard scrollPosition.y <= 0 else {
                return
            }
            
            // Проверяем, что scrollPosition.y увеличилось
            if oldValue.y < scrollPosition.y {
                if !isScrollingDown {
                    isScrollingDown = true
                }
            }
        }
        
        willSet(newValue) {
            print("willSet: Current Value: \(Int(scrollPosition.y)), New Value: \(Int(newValue.y))")
            // Сравнение старого и нового значения в willSet
            if newValue.y < scrollPosition.y {
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
        //        if isScrollingDown || scrollPosition.y >= 0.1 {
        //            print("aaaaa")
        //            return 0.0
        //        } else {
        //            print("bbbb")
        //  return scrollPosition.y
        //   }
        
        if scrollPosition.y >= 0.1 {
            return 0.0
        } else {
            return scrollPosition.y
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
