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
                return print("1")
            }
            
            // Проверяем, что scrollPosition.y увеличилось
            if oldValue.y < scrollPosition.y {
                if !isScrollingDown {
                    print("scrollPosition didSet: \(oldValue.y) -> \(scrollPosition.y)")
                    withAnimation(.spring()) {
                        isScrollingDown = true
                    }
                }
            }
        }
        
        willSet(newValue) {
            // Сравнение старого и нового значения в willSet
            if newValue.y < scrollPosition.y {
                print("scrollPosition willSet: \(scrollPosition.y) -> \(newValue.y)")
                withAnimation(.spring()) {
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
                Text("LogoPanel")
                    .padding()
                    .background(.blue)
                    .offset(y: calculateOffset(scrollPosition))
                
                //  .opacity(effect(scrollPosition))
                //.scaleEffect(!isScrollingDown ? 1 : 0.75)
                //  .blur(radius: !isScrollingDown ? 0 : 10)
                
                    .padding(.top, 10)
                
                
                VStack {
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
                                .preference(key: ScrollOffsetPreferenceKey4.self, value: geometry.frame(in: .named("scroll")).origin)
                        })
                        .onPreferenceChange(ScrollOffsetPreferenceKey4.self) { value in
                            self.scrollPosition = value
                        }
                    }
                    .coordinateSpace(name: "scroll")
                    .navigationTitle("Scroll offset: \(scrollPosition.y)")
                    
                }
                .padding(.top, 70)
                .navigationBarTitleDisplayMode(.inline)
                
            }
        }
    }
    private func calculateOffset(_ scrollPosition: CGPoint) -> CGFloat {
        if isScrollingDown {
            return 0.0
        } else {
            return scrollPosition.y
        }
    }
    
    private func effect(_ scrollPosition: CGPoint) -> CGFloat {
        guard scrollPosition.y >= 0 else {
            return 1
        }
        
        return scrollPosition.y + 1
        
        
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
