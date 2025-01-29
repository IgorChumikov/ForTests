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

    @State private var showCreateFolderAlert = false
    @State private var newFolderName = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(bookmarks) { bookmark in
                    Button {
                        handleBookmarkTap(bookmark)
                    } label: {
                        BookmarkRow(bookmark: bookmark, isEditing: isEditing, isSelected: selectedItems.contains(bookmark.id))
                    }
                    .buttonStyle(PlainButtonStyle()) // Убираем стандартный стиль кнопки
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
            .listStyle(.inset)
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
                        Button("Создать папку") {
                            newFolderName = ""  // Сброс имени перед открытием алерта
                            showCreateFolderAlert = true
                        }
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
            .alert("Введите имя папки", isPresented: $showCreateFolderAlert) {
                TextField("Название папки", text: $newFolderName)
                Button("Отмена", role: .cancel) {
                    newFolderName = ""  // Сброс имени при отмене
                }
                Button("Готово") {
                    createFolder(with: newFolderName)
                    newFolderName = ""  // Сброс имени после создания
                }
            }
        }
    }

    // MARK: - Методы
    
    private func handleBookmarkTap(_ bookmark: Bookmark) {
        if isEditing {
            toggleSelection(for: bookmark.id)
        } else {
            print("Открываем: \(bookmark.name ?? bookmark.title ?? "Без названия")")
            // Здесь можно добавить логику перехода к документу или папке
        }
    }

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
                title: bookmark.type == .document ? newName : bookmark.title,
                edition: bookmark.edition,
                edition_date: bookmark.edition_date,
                base: bookmark.base,
                docnumber: bookmark.docnumber,
                lasted: bookmark.lasted,
                name: bookmark.type == .folder || bookmark.type == .bookmark ? newName : bookmark.name, // ✅ Исправлено
                comment: bookmark.comment,
                paragraph: bookmark.paragraph,
                page: bookmark.page,
                label: bookmark.label,
                offset: bookmark.offset
            )
        }
    }


    private func createFolder(with name: String) {
        guard !name.isEmpty else { return }
        
        let newFolder = Bookmark(
            id: UUID().uuidString,
            type: .folder,
            time: Date(),
            parent_id: nil,
            url: nil,
            title: nil,
            edition: nil,
            edition_date: nil,
            base: nil,
            docnumber: nil,
            lasted: nil,
            name: name,
            comment: nil,
            paragraph: nil,
            page: nil,
            label: nil,
            offset: nil
        )
        bookmarks.insert(newFolder, at: 0)
    }
}

// MARK: - Ячейка списка
struct BookmarkRow: View {
    let bookmark: Bookmark
    let isEditing: Bool
    let isSelected: Bool
    
    @State private var isPressed = false  // Следим за нажатием
    
    var body: some View {
        HStack {
            if isEditing {
                Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                    .foregroundColor(isSelected ? .blue : .gray)
            }
            
            // Иконки в зависимости от типа
            if bookmark.type == .folder {
                Image(systemName: "folder.fill").foregroundColor(.yellow)
            } else if bookmark.type == .document {
                Image(systemName: "doc.fill").foregroundColor(.blue)
            } else if bookmark.type == .bookmark {
                Image(systemName: "bookmark.fill").foregroundColor(.gray)
            }
            
            VStack(alignment: .leading) {
                if let name = bookmark.name {
                    Text(name)
                        .font(.headline)
                        .foregroundColor(bookmark.type == .bookmark ? .gray : .primary)
                }
                if let title = bookmark.title {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(bookmark.type == .document ? .primary : .gray)
                }
                if let comment = bookmark.comment {
                    Text(comment).font(.subheadline).foregroundColor(.gray)
                }
            }
            Spacer()
        }
        .padding(.vertical, 5)
        .background(isPressed ? Color.purple.opacity(0.3) : Color.clear) // Фиолетовый при нажатии
        .cornerRadius(8)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isPressed = true }
                .onEnded { _ in isPressed = false }
        )
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
