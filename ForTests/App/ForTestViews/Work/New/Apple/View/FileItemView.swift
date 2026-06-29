//
//  FileItemView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.09.2024.
//

import SwiftUI

struct FileItemView: View {
    let item: FileItem
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(iconColor)
            Text(item.name)
        }
    }
    
    private var iconName: String {
        switch item.children {
        case nil:
            return "doc"
        case .some(let children):
            return children.isEmpty ? "folder" : "folder.fill"
        }
    }
    
    private var iconColor: Color {
        switch item.children {
        case nil:
            return .blue
        case .some(let children):
            return children.isEmpty ? .yellow : .orange
        }
    }
}

#Preview {
    FileItemView(item: FileItem(name: "Rell", children: nil))
}
