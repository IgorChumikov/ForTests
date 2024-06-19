//
//  SheetStartTest.swift
//  ForTests
//
//  Created by Игорь Чумиков on 18.06.2024.
//

import SwiftUI

struct SheetStartTest: View {
    
    @State var showInfoSheet: Bool = false
    @State var contentSize: CGFloat = 0
    
    @State var showInfoSheet2: Bool = false
    
    var body: some View {
        ZStack {
            logoutInfoSheet
            VStack(alignment: .center, spacing: 40) {
                Button("showInfoSheet") {
                    showInfoSheet.toggle()
                }
                Button("showInfoSheet2") {
                    showInfoSheet2.toggle()
                }
            }
        }
        .sheet(isPresented: $showInfoSheet) {
            Group {
                if #available(iOS 16.0, *) {
                    ResizableLogoutInfoSheetView(contentSize: $contentSize) {
                            showInfoSheet.toggle()
                        }
                        .presentationDetents([.height(contentSize - 50)])
                        .presentationDragIndicator(.visible)
                }
            }
        }
    }
    
    private var logoutInfoSheet: some View {
        CustomResizableLogoutInfoSheetView(isSheetPresented: $showInfoSheet2)
        .zIndex(2)
        .hidden(!showInfoSheet2, mode: .removed)
    }
    
}

#Preview {
    SheetStartTest()
}
