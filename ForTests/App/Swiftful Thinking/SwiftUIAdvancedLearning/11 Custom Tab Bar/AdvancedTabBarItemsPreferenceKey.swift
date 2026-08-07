//
//  AdvancedTabBarItemsPreferenceKey.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by Nick Sarno on 9/6/21.
//

import Foundation
import SwiftUI

struct AdvancedTabBarItemsPreferenceKey: PreferenceKey {
    
    static var defaultValue: [AdvancedTabBarItem] = []
    
    static func reduce(value: inout [AdvancedTabBarItem], nextValue: () -> [AdvancedTabBarItem]) {
        value += nextValue()
    }
    
}

struct AdvancedTabBarItemViewModifer: ViewModifier {
    
    let tab: AdvancedTabBarItem
    @Binding var selection: AdvancedTabBarItem
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1.0 : 0.0)
            .preference(key: AdvancedTabBarItemsPreferenceKey.self, value: [tab])
    }
    
}

struct AdvancedTabBarItemViewModiferWithOnAppear: ViewModifier {
    
    let tab: AdvancedTabBarItem
    @Binding var selection: AdvancedTabBarItem
    
    @ViewBuilder func body(content: Content) -> some View {
        if selection == tab {
            content
                .opacity(1)
                .preference(key: AdvancedTabBarItemsPreferenceKey.self, value: [tab])
        } else {
            Text("")
                .opacity(0)
                .preference(key: AdvancedTabBarItemsPreferenceKey.self, value: [tab])
        }
    }
    
}

extension View {
    
    func tabBarItem(tab: AdvancedTabBarItem, selection: Binding<AdvancedTabBarItem>) -> some View {
//        modifier(AdvancedTabBarItemViewModifer(tab: tab, selection: selection))
        modifier(AdvancedTabBarItemViewModiferWithOnAppear(tab: tab, selection: selection))
    }
    
}
