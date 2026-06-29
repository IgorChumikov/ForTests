//
//  AppTabBarView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Игорь Чумиков  on 9/6/21.
//

import SwiftUI

// Generics
// ViewBuilder
// PreferenceKey
// MatchedGeometryEffect

struct AppTabBarView: View {
    
    @State private var selection: String = "home"
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            TestTabView(text: "1")
                .tabBarItem(tab: .profile, selection: $tabSelection)
            
            TestTabView(text: "2")
                .tabBarItem(tab: .messages, selection: $tabSelection)

            TestTabView(text: "3")
                .tabBarItem(tab: .home, selection: $tabSelection)
            
            TestTabView(text: "4")
                .tabBarItem(tab: .favorites, selection: $tabSelection)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppTabBarView()
    }
}


struct TestTabView: View {
    
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
