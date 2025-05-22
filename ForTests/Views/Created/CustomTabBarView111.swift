//
//  CustomTabBarView111.swift
//  ForTests
//
//  Created by Игорь Чумиков on 19.05.2025.
//

import SwiftUI

struct CustomTabBarView111: View {
    @State private var selectedTab: Tab = .favorites
    @State private var show = true
    
    enum Tab {
        case main
        case favorites
        case history
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Главное содержимое")
                .tabItem {
                    VStack {
                        Image(systemName: "briefcase.fill")
                            .foregroundColor(selectedTab == .main ? .purple : .gray)
                        Text("Главное")
                    }
                }
                .tag(Tab.main)
            
            Button("Open Popover") {
                self.show.toggle()
            }
            .tabItem {
                VStack {
                    ZStack {
                        Image(systemName: "star")
                    }
                    Text("Избранное")
                }
            }
            .tag(Tab.favorites)
            .badge("!")
            .popover(isPresented: $show) {
                ZStack {
                    popover
                        .presentationCompactAdaptation(.popover)
                        .presentationBackground(Color(red: 1.0, green: 0.97, blue: 0.80))
                }
            }
            
            
            Text("История содержимого")
                .tabItem {
                    VStack {
                        Image(systemName: "clock.arrow.circlepath")
                        Text("История")
                    }
                }
                .tag(Tab.history)
        }
    }
    
    
    private var popover: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "bolt.fill")
                .frame(width: 24, height: 24)
                .foregroundColor(.white)
                .background(Circle().fill(Color.red))
            VStack(alignment: .leading, spacing: 4) {
                Text("Произошли изменения в документах на контроле.")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                Text("Нажмите для просмотра")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    CustomTabBarView111()
}
