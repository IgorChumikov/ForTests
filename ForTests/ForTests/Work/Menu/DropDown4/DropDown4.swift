//
//  DropDown4.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.06.2024.
//

import SwiftUI

struct DropDown4: View {
    
    let options: [String]
    
    var menuWdith: CGFloat = 150
    var buttonHeight: CGFloat = 50
    var maxItemDisplayed: Int = 3

    @Binding var selectedOptionIndex: Int
    @Binding var showDropdown: Bool
    
    @State private var scrollPosition: Int?

    var body: some View {
        VStack {

            VStack(spacing: 0) {
                // selected item
                Button(action: {
                    withAnimation {
                        showDropdown.toggle()
                    }
                }, label: {
                    HStack(spacing: nil) {
                        Text(options[selectedOptionIndex])
                        Spacer()
                        Image(systemName: "chevron.down")
                            .rotationEffect(.degrees((showDropdown ? -180 : 0)))
                    }
                })
                .padding(.horizontal, 20)
                .frame(width: menuWdith, height: buttonHeight, alignment: .leading)

                
                // selection menu
                if (showDropdown) {
                    let scrollViewHeight: CGFloat = options.count > maxItemDisplayed ? (buttonHeight*CGFloat(maxItemDisplayed)) : (buttonHeight*CGFloat(options.count))
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(0..<options.count, id: \.self) { index in
                                Button(action: {
                                    withAnimation {
                                        selectedOptionIndex = index
                                        showDropdown.toggle()
                                    }

                                }, label: {
                                    HStack {
                                        Text(options[index])
                                        Spacer()
                                        if (index == selectedOptionIndex) {
                                            Image(systemName: "checkmark.circle.fill")

                                        }
                                    }
                                
                                })
                                .padding(.horizontal, 20)
                                .frame(width: menuWdith, height: buttonHeight, alignment: .leading)

                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollPosition(id: $scrollPosition)
                    .scrollDisabled(options.count <= 3)
                    .frame(height: scrollViewHeight)
                    .onAppear {
                        scrollPosition = selectedOptionIndex
                    }
                
                }
                
            }
            .foregroundStyle(Color.white)
            .background(RoundedRectangle(cornerRadius: 16).fill(Color.black))
            
        }
        .frame(width: menuWdith, height: buttonHeight, alignment: .top)
        .zIndex(100)
        
    }
}

#Preview {
    let fruits = ["apple", "banana", "orange", "kiwi"]
    @State  var selectedOptionIndex = 0
    @State  var showDropdown = false
    
  return  DropDown4(options: fruits, selectedOptionIndex: $selectedOptionIndex, showDropdown: $showDropdown)
}
