//
//  AdvancedAppTabBarView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Nick Sarno on 9/6/21.
//

import SwiftUI

// Generics
// ViewBuilder
// PreferenceKey
// MatchedGeometryEffect

struct AdvancedAppTabBarView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: AdvancedTabBarItem = .home
    
    var body: some View {
        AdvancedCustomTabBarContainerView(selection: $tabSelection) {
            AdvancedTestTabView(text: "1")
                .tabBarItem(tab: .profile, selection: $tabSelection)
            
            AdvancedTestTabView(text: "2")
                .tabBarItem(tab: .messages, selection: $tabSelection)

            AdvancedTestTabView(text: "3")
                .tabBarItem(tab: .home, selection: $tabSelection)
            
            AdvancedTestTabView(text: "4")
                .tabBarItem(tab: .favorites, selection: $tabSelection)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct AdvancedAppTabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        AdvancedAppTabBarView()
    }
}

extension AdvancedAppTabBarView {
    
    private var defaultTabView: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
    
}

struct AdvancedTestTabView: View {
    
    let text: String
    @State private var textFieldText: String = ""
    
    init(text: String) {
        self.text = text
        print("INIT" + text)
    }
    
    var body: some View {
        VStack {
            Text(text)
                .onAppear {
                    print("ONAPPEAR" + text)
            }
            TextField("Type something...", text: $textFieldText)
                .disableAutocorrection(true)
            
        }
    }
}
