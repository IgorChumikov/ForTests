//
//  MainCurtainView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 14.05.2024.
//

import SwiftUI

struct MainCurtainView: View {
    
    @State private var isSheetPresented: Bool = false
    
    var body: some View {
        ZStack {
            ExitCurtainView(isSheetPresented: $isSheetPresented)
            VStack {
                Button("ffff") {
                    isSheetPresented.toggle()
                }
            }
        }
    }
}

#Preview {
    MainCurtainView()
}
