
//  ResizableSheetsView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 15.05.2024.
//

import SwiftUI

struct ResizableSheetsView: View {
    
    @State var showSweet: Bool = false
    
    var body: some View {
        Button("Click mi") {
            showSweet.toggle()
        }
        .sheet(isPresented: $showSweet) {
            ResizableSheets2View() {
                showSweet.toggle()
            }
                .presentationDetents([.height(200)])
                .presentationDragIndicator(.hidden)
                .interactiveDismissDisabled()
        }
    }
}

#Preview {
    ResizableSheetsView()
}

