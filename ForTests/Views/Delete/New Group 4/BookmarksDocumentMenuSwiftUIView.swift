//
//  BookmarksDocumentMenuSwiftUIView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 16.06.2025.
//

import SwiftUI

struct BookmarksDocumentMenuSwiftUIView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Закладки")
                .font(.title2.bold())
                .padding(.horizontal)
                .padding(.top)
                .padding(.bottom, 25)

            List(mockBookmarks) { bookmark in
                VStack(alignment: .leading, spacing: 4) {
                    Text(bookmark.title)
                        .font(.body)
                        .foregroundColor(.primary)
                        .lineLimit(5)

                    Text(bookmark.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
                .contextMenu {
                    contextMenuRenameButton()
                    contextMenuDeleteButton()
                }
            }
            .listStyle(.plain)
        }
    }
    
    // MARK: - ContextMenu
    
    private func contextMenuRenameButton() -> some View {
        Button {
          //  viewModel.prepareItemForRename(item)
        } label: {
            HStack {
              //  Asset.Image.favoritesRename
                Text("Rename text")
            }
        }
    }
    
    private func contextMenuDeleteButton() -> some View {
        Button(role: .destructive) {
         //   viewModel.deleteItem(item)
        } label: {
            HStack(alignment: .center, spacing: .zero) {
             //   Asset.Image.favoritesTrash
                Text("Delete text")
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    BookmarksDocumentMenuSwiftUIView()
}
