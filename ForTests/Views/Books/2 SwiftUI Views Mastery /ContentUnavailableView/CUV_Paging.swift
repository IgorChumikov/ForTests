//
//  CUV_Paging.swift
//  ForTests
//
//  Created by Игорь Чумиков on 01.10.2025.
//

import SwiftUI

struct CUV_Paging: View {
    var body: some View {
        TabView {
            ContentUnavailableView(
                "Look",
                image: "look",
                description: Text("Look through all the pictures in the book")
            )
            
            ContentUnavailableView(
                "Learn",
                image: "learn",
                description: Text("Learn what is possible.")
            )
            
            ContentUnavailableView(
                "Remember",
                image: "look",
                description: Text("You can remember pictures 60k faster than code.")
            )
        }
        .tabViewStyle(.page) // постраничная прокрутка
        .indexViewStyle(.page(backgroundDisplayMode: .always)) // индикатор страниц
    }
}


#Preview {
    CUV_Paging()
}
