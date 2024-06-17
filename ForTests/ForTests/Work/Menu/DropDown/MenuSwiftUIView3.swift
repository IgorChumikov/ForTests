//
//  MenuSwiftUIView3.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.06.2024.
//

import SwiftUI

struct MenuSwiftUIView3: View {
    @State private var selection: DropDownSelection = .init(value: "Easy")
    @State private var selection1: DropDownSelection = .init(value: "On")
    @State private var selection2: DropDownSelection = .init(value: "Mid")
    var body: some View {
        VStack(spacing: 10){
            HStack{
                Text("Game Difficuly")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                DropDown(
                    content: ["Easy","Normal","Hard","Expert"],
                    selection: $selection,
                    font: .body,
                    activeTint: Color("Active"),
                    inActiveTint: .black,
                    dynamic: true,
                    height: 45
                )
                .frame(width: 110)
            }
            .zIndex(selection.zIndex)
            
            HStack{
                Text("Auto Aim")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                DropDown(
                    content: ["On","Off"],
                    selection: $selection1,
                    font: .body,
                    activeTint: Color("Active"),
                    inActiveTint: .black,
                    dynamic: true,
                    height: 45
                )
                .frame(width: 80)
            }
            .zIndex(selection1.zIndex)
            
            HStack{
                Text("Brightness")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                DropDown(
                    content: ["High","Mid","Low"],
                    selection: $selection2,
                    font: .body,
                    activeTint: Color("Active"),
                    inActiveTint: .black,
                    dynamic: true,
                    height: 45
                )
                .frame(width: 95)
            }
            .zIndex(selection2.zIndex)
        }
        .padding(10)
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .center)
        .background {
            Color("BG")
                .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
    }
}


#Preview {
    MenuSwiftUIView3()
}
