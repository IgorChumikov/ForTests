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
                ContentOneeView()
                    .frame(width: 300)
                Divider()
                    .ignoresSafeArea()
                ContentOneeView()
                    .frame(maxWidth: .infinity)
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    GoogleIpadSwiftUIView()
}
