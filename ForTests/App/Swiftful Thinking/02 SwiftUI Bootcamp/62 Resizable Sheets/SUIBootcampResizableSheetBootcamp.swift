//
//  SUIBootcampResizableSheetBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Nick Sarno on 5/16/23.
//

import SwiftUI

struct SUIBootcampResizableSheetBootcamp: View {
    
    @State private var showSheet: Bool = false
    @State private var detents: PresentationDetent = .large
    
    var body: some View {
        Button("Click me!") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            SUIBootcampMyNextView(detents: $detents)
//                .presentationDetents([.medium, .large])
//                .presentationDetents([.fraction(0.1), .height(300), .medium, .large])
//                .presentationDetents([.height(500)])
//                .presentationDetents([.fraction(0.5), .medium, .large], selection: $detents)
//                .presentationDragIndicator(.hidden)
//                .interactiveDismissDisabled()
        }
//        .onAppear {
//            showSheet = true
//        }
    }
}

struct SUIBootcampMyNextView: View {
    
    @Binding var detents: PresentationDetent
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Button("20%") {
                    detents = .fraction(0.2)
                }
                
                Button("MEDIUM") {
                    detents = .medium
                }
                
                Button("600 PX") {
                    detents = .height(600)
                }
                
                Button("LARGE") {
                    detents = .large
                }
            }
        }
        .presentationDetents([.fraction(0.2), .medium, .height(600), .large], selection: $detents)
        .presentationDragIndicator(.hidden)
    }
}

struct SUIBootcampResizableSheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SUIBootcampResizableSheetBootcamp()
    }
}
