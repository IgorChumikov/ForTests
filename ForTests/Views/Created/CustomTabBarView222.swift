//
//  CustomTabBarView222.swift
//  ForTests
//
//  Created by Игорь Чумиков on 19.05.2025.
//

import SwiftUI

struct CustomTabBarView222: View {
    @State private var selectedTab: Tab = .main
    @State private var showPopover = false
    
    enum Tab {
        case main, favorites, history
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                Text("Главное содержимое")
                    .tabItem {
                        Label("Главное", systemImage: "briefcase.fill")
                    }
                    .tag(Tab.main)
                
                Text("Избранное")
                    .tabItem {
                        Label("Избранное", systemImage: "star")
                    }
                    .tag(Tab.favorites)
                    .badge(showPopover ? "!" : nil)
                
                Text("История содержимого")
                    .tabItem {
                        Label("История", systemImage: "clock.arrow.circlepath")
                    }
                    .tag(Tab.history)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            showPopover.toggle()
                        }
                    } label: {
                        Image(systemName: "bell.badge")
                    }
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    // Над "Избранное" — по центру экрана
                    if showPopover {
                        popoverContent
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                            .padding(.bottom, 60)
                    }
                    Spacer()
                }
            }
        }
        .onAppear {
            // Показываем подсказку через 1 сек, как пример
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
             //       showPopover = true
                }
                // Автоматически скрыть через 3 секунды
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        //  showPopover = false
                    }
                }
            }
        }
    }
    
    private var popoverContent: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "bolt.fill")
                .frame(width: 24, height: 24)
                .foregroundColor(.white)
                .background(Circle().fill(Color.red))
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Произошли изменения в документах на контроле.")
                    .font(.system(size: 14))
                Text("Нажмите для просмотра")
                    .font(.system(size: 14))
            }
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(red: 1.0, green: 0.97, blue: 0.8))
                .shadow(radius: 2)
        )
        .overlay(
            Triangle()
                .fill(Color(red: 1.0, green: 0.97, blue: 0.8))
                .frame(width: 16, height: 10)
                .offset(y: 10),
            alignment: .bottom
        )
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.width / 2, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.closeSubpath()
        return path
    }
}


#Preview {
    NavigationView {
        CustomTabBarView222()
    }
}
