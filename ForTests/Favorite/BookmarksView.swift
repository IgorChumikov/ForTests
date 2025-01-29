//
//  BookmarksView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 29.01.2025.
//

import SwiftUI

struct BookmarksView: View {
    @State private var bookmarks = BookmarksList.mock.list
    @State private var selectedItems: Set<String> = []
    @State private var isEditing = false
    @State private var renameItem: Bookmark? = nil
    @State private var newName: String = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(bookmarks) { bookmark in
                    BookmarkRow(bookmark: bookmark, isEditing: isEditing, isSelected: selectedItems.contains(bookmark.id))
                        .onTapGesture {
                            if isEditing {
                                toggleSelection(for: bookmark.id)
                            }
                        }
                        .swipeActions {
                            Button("Удалить", role: .destructive) {
                                deleteItem(bookmark)
                            }
                            Button("Переименовать") {
                                renameItem = bookmark
                                newName = bookmark.name ?? bookmark.title ?? ""
                            }
                            .tint(.blue)
                        }
                }
            }
            .navigationTitle("Закладки и документы")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if isEditing, !selectedItems.isEmpty {
                        Button("Удалить", role: .destructive, action: deleteSelected)
                    } else {
                        Button("Назад") { }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button("Создать папку", action: createFolder)
                        Button("Выбрать", action: toggleEditingMode)
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
            .sheet(item: $renameItem) { bookmark in
                RenameView(name: $newName) { newName in
                    rename(bookmark, newName: newName)
                }
            }
        }
    }

    // MARK: - Методы

    private func toggleEditingMode() {
        isEditing.toggle()
        if !isEditing {
            selectedItems.removeAll()
        }
    }

    private func toggleSelection(for id: String) {
        if selectedItems.contains(id) {
            selectedItems.remove(id)
        } else {
            selectedItems.insert(id)
        }
    }

    private func deleteSelected() {
        bookmarks.removeAll { selectedItems.contains($0.id) }
        selectedItems.removeAll()
        isEditing = false
    }

    private func deleteItem(_ bookmark: Bookmark) {
        bookmarks.removeAll { $0.id == bookmark.id }
    }

    private func rename(_ bookmark: Bookmark, newName: String) {
        if let index = bookmarks.firstIndex(where: { $0.id == bookmark.id }) {
            bookmarks[index] = Bookmark(
                id: bookmark.id,
                type: bookmark.type,
                time: bookmark.time,
                parent_id: bookmark.parent_id,
                url: bookmark.url,
                title: bookmark.type == .document ? newName : nil,
                edition: bookmark.edition,
                edition_date: bookmark.edition_date,
                base: bookmark.base,
                docnumber: bookmark.docnumber,
                lasted: bookmark.lasted,
                name: bookmark.type == .folder ? newName : nil,
                comment: bookmark.comment,
                paragraph: bookmark.paragraph,
                page: bookmark.page,
                label: bookmark.label,
                offset: bookmark.offset
            )
        }
    }

    private func createFolder() {
        let newFolder = Bookmark(id: UUID().uuidString, type: .folder, time: Date(), parent_id: nil, url: nil, title: nil, edition: nil, edition_date: nil, base: nil, docnumber: nil, lasted: nil, name: "Новая папка", comment: nil, paragraph: nil, page: nil, label: nil, offset: nil)
        bookmarks.insert(newFolder, at: 0)
    }
}

// MARK: - Ячейка списка
struct BookmarkRow: View {
    let bookmark: Bookmark
    let isEditing: Bool
    let isSelected: Bool

    var body: some View {
        HStack {
            if isEditing {
                Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                    .foregroundColor(isSelected ? .blue : .gray)
            }
            if bookmark.type == .folder {
                Image(systemName: "folder.fill").foregroundColor(.yellow)
            } else {
                Image(systemName: "doc.fill").foregroundColor(.blue)
            }
            VStack(alignment: .leading) {
                if let name = bookmark.name {
                    Text(name).font(.headline)
                }
                if let title = bookmark.title {
                    Text(title).font(.headline).foregroundColor(.blue)
                }
                if let comment = bookmark.comment {
                    Text(comment).font(.subheadline).foregroundColor(.gray)
                }
            }
            Spacer()
        }
        .padding(.vertical, 5)
    }
}

// MARK: - Экран переименования
struct RenameView: View {
    @Binding var name: String
    var onSave: (String) -> Void
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                TextField("Введите новое название", text: $name)
            }
            .navigationTitle("Переименование")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Отмена") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Сохранить") {
                        onSave(name)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

// MARK: - Превью
struct BookmarksView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarksView()
    }
}
