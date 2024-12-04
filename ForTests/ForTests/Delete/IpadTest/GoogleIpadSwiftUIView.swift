//
//  GoogleIpadSwiftUIView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 04.12.2024.
//

import SwiftUI

struct GoogleIpadSwiftUIView: View {
    var body: some View {
        
        NavigationView {
            ContentOneeView()
            ContentOneeView()
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
            .padding()
    }
}

#Preview {
    GoogleIpadSwiftUIView()
}
