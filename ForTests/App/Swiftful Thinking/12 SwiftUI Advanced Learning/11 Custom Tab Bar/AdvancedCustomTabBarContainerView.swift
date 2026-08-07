//
//  AdvancedCustomTabBarContainerView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Nick Sarno on 9/6/21.
//

import SwiftUI

struct AdvancedCustomTabBarContainerView<Content:View>: View {
    
    @Binding var selection: AdvancedTabBarItem
    let content: Content
    @State private var tabs: [AdvancedTabBarItem] = []
    
    init(selection: Binding<AdvancedTabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            AdvancedCustomTabBarView(tabs: tabs, selection: $selection, localSelection: selection)
            
        }
        .onPreferenceChange(AdvancedTabBarItemsPreferenceKey.self, perform: { value in
            self.tabs = value
        })
    }
}

struct AdvancedCustomTabBarContainerView_Previews: PreviewProvider {
    
    static let tabs: [AdvancedTabBarItem] = [
        .home, .favorites, .profile
    ]
    
    static var previews: some View {
        AdvancedCustomTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}
