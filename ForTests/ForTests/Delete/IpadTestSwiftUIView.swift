//
//  IpadTestSwiftUIView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 04.12.2024.
//

import SwiftUI

// iOS 16.0

struct IpadTestSwiftUIView: View {
    
    @State private var columnVisibility =
    NavigationSplitViewVisibility.doubleColumn
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility){
            List(0..<30){ i in
                NavigationLink(destination: Text("Details of \(i)")) {
                    Text("id:\(i)")
                }

            } .navigationBarHidden(true)

        } detail: {
            Text("Choose an item from the content")
            
        }
        .navigationSplitViewStyle(.balanced) // this
    }
}

#Preview {
    IpadTestSwiftUIView()
}
