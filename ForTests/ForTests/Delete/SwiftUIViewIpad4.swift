//
//  SwiftUIViewIpad4.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.10.2024.
//

import SwiftUI

struct SwiftUIViewIpad4: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<10) { index in
                    NavigationLink("Item \(index)", destination: Text("Detail \(index)"))
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Menu")
            
            Text("Select an item")
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

#Preview {
    SwiftUIViewIpad4()
}
