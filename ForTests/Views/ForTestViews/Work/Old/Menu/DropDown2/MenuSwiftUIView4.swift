//
//  MenuSwiftUIView4.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.06.2024.
//

import SwiftUI

struct MenuSwiftUIView4: View {
    /// View Properties
    @State private var selection: String?
    @State private var selection1: String?
    @State private var selection2: String?
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                DropDownView(
                    hint: "Select",
                    options: [
                        "YouTube",
                        "Instagram",
                        "X (Twitter)",
                        "Snapchat",
                        "TikTok"
                    ],
                    anchor: .bottom,
                    selection: $selection
                )
                
                DropDownView(
                    hint: "Select",
                    options: [
                        "Short Form",
                        "Long Form",
                        "Both"
                    ],
                    anchor: .top,
                    selection: $selection1
                )
                
                DropDownView(
                    hint: "Select",
                    options: [
                        "Education",
                        "Tech",
                        "Others"
                    ],
                    anchor: .top,
                    selection: $selection2
                )
                
                Button("I'm Button") {
                    
                }
            }
            .navigationTitle("Dropdown Picker")
        }
    }
}

#Preview {
    MenuSwiftUIView4()
}
