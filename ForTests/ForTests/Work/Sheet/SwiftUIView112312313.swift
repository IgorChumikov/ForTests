//
//  SwiftUIView112312313.swift
//  ForTests
//
//  Created by Игорь Чумиков on 18.06.2024.
//

import SwiftUI

struct SwiftUIView112312313: View {
    
    @State var showInfoSheet: Bool = false
    @State var contentSize: CGFloat = 0
    
    var body: some View {
        ZStack {
            Button("showInfoSheet") {
                showInfoSheet.toggle()
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
    
}

#Preview {
    SwiftUIView112312313()
}
