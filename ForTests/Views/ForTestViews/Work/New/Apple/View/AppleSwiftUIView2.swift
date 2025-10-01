//
//  AppleSwiftUIView2.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.09.2024.
//

import SwiftUI

struct AppleSwiftUIView2: View {
    let fileHierarchyData: [FileItem] = [
        FileItem(
            name: "Гражданский кодекс Российской Федерации (ГК РФ)", children:[
                FileItem(name: "Глава 1. Гражданское законодательство", children: [
                    FileItem(name: "Photos", children: [
                        FileItem(name: "photo001.jpg"),
                        FileItem(name: "photo002.jpg")
                    ]),
                    FileItem(name: "Movies", children: [
                        FileItem(name: "movie001.mp4")
                    ]),
                    FileItem(name: "Documents", children: [])
                ]),
                FileItem(name: "Статья 7. Гражданское законодательство и нормы международного права", children: [
                    FileItem(name: "Documents", children: [])
                ])
            ]
        ),
        FileItem(name: "private", children: nil)
    ]
    
    var body: some View {
        List(fileHierarchyData, children: \.children) { item in
            FileItemView(item: item)
        }
        .listStyle(.grouped)
    }
    
}


#Preview {
    AppleSwiftUIView2()
}
