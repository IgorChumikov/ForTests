//
//  BookmarksDocumentMenuSwiftUIView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 16.06.2025.
//

import SwiftUI

struct BookmarksDocumentMenuSwiftUIView: View {
    
    var body: some View {
        content
    }
    
    // MARK: - Views
    
    private var content: some View {
        VStack(alignment: .center, spacing: .zero) {
            header
            list
            closeButton
        }
    }
    
    private var header: some View {
        Text("Закладки")
            .font(.title2.bold())
            .padding(.horizontal)
            .padding(.top)
            .padding(.bottom, 25)
    }
    
    private var list: some View {
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
            .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                swipeDeleteButton()
                swipeRenameButton()
            }
            .contextMenu {
                contextMenuRenameButton()
                contextMenuDeleteButton()
            }
        }
        .listStyle(.plain)
    }
    
    private var closeButton: some View {
        Button {
            //
        } label: {
            Image(systemName: "cat")
                .frame(width: 80, height: 52)
        }
    }
    
    // MARK: - SwipeActions
    
    private func swipeDeleteButton() -> some View {
        Button {
            //   viewModel.deleteItem(item)
        } label: {
            Text("Delete text")
        }
        .tint(.red)
    }
    
    private func swipeRenameButton() -> some View {
        Button {
            // viewModel.prepareItemForRename(item)
        } label: {
            Text("Rename text")
        }
        .tint(.gray)
    }
    
    // MARK: - ContextMenu тут FavoritesDocBookmarkView
    
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
