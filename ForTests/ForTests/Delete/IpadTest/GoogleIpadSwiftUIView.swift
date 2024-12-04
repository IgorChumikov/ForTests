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
            HStack(alignment: .center, spacing: 0) {
                Spacer()
                ContentOneeView()
                Spacer()
                Divider().ignoresSafeArea()
                Spacer()
                ContentOneeView()
                Spacer()
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    GoogleIpadSwiftUIView()
}
