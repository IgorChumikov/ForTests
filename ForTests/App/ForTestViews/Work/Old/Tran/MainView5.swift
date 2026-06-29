//
//  MainView5.swift
//  ForTests
//
//  Created by Игорь Чумиков on 13.06.2024.
//

import SwiftUI

struct MainView5: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: View5()) {
                    Text("Открыть View5")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .navigationTitle("Main View")
            }
        }
    }
}

#Preview {
    MainView5()
}

