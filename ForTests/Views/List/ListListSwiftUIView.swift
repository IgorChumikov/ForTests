//
//  ListListSwiftUIView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 21.07.2025.
//

import SwiftUI

struct ListListSwiftUIView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Chocolate")
                Text("Vanilla")
                Text("Strawberry")
            }
            .listStyle(.plain)
            .navigationTitle("Сегодняшние вкусы")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Часы") {
                        print("Tapped Часы")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button("Избранное") { }
                        Button("Спецпредл.") { }
                    }
                }
            }
        }

    }
}


#Preview {
    NavigationView {
        ListListSwiftUIView()
    }
}
