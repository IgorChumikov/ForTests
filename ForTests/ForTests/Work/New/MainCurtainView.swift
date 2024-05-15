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
                Button("До 16 IOS") {
                    isSheetPresented.toggle()
                }
            }
        }
    }
}

#Preview {
    MainCurtainView()
}




//struct MainCurtainView: View {
//    
//    @State private var isSheetPresented: Bool = false
//    
//    var body: some View {
//        ZStack {
//            content
//            if isSheetPresented {
//                Color.black.opacity(0.4)
//                    .edgesIgnoringSafeArea(.all)
//                    .onTapGesture {
//                        isSheetPresented.toggle()
//                    }
//                
//                ExitCurtainView(isSheetPresented: $isSheetPresented)
//                    .transition(.move(edge: .bottom))
//                    .zIndex(1)
//            }
//        }
//        .animation(.easeInOut(duration: 0.3))
//    }
//    
//    private var content: some View {
//        VStack {
//            Button("До 16 IOS") {
//                isSheetPresented.toggle()
//            }
//        }
//        .disabled(isSheetPresented)  // Отключаем взаимодействие, когда лист показан
//        .blur(radius: isSheetPresented ? 3 : 0)  // Добавляем размытие
//    }
//}
