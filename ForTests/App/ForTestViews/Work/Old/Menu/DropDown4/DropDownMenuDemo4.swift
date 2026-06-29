//
//  DropDownMenuDemo4.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.06.2024.
//

import SwiftUI

struct DropDownMenuDemo4: View {

    let fruits = ["apple", "banana", "orange", "kiwi"]
    @State private var selectedOptionIndex = 0
    @State private var showDropdown = false

    var body: some View {
        VStack {
            DropDown4(options: fruits, selectedOptionIndex: $selectedOptionIndex, showDropdown: $showDropdown)
            Spacer()
                .frame(height: 30)
            Text("You have selected \(fruits[selectedOptionIndex])")

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color.yellow)
        .onTapGesture {
            withAnimation {
                showDropdown = false
            }
        }
    }
}

#Preview {
    DropDownMenuDemo4()
}
