//
//  BottomSheetView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 15.05.2024.
//


import SwiftUI

struct BottomSheetView: View {
    @State private var showingSheet = false
    @State private var selectedOption = "Apple"

    let options = ["Apple", "Banana", "Orange", "Pear"]

    var body: some View {
        Button("Show Sheet") { showingSheet = true }
        .sheet(isPresented: $showingSheet) {
            NavigationStack {
                List {
                    Picker("Choose a fruit", selection: $selectedOption) {
                        ForEach(options, id: \.self) { option in
                            Text(option)
                        }
                    }
                }
            }
            .presentationDetents([.medium, .large])
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView()
    }
}
