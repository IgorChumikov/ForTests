//
//  SwiftUIViewSwiftUIView.swift
//  ConsultantPlus
//
//  Created by Игорь Чумиков on 19.01.2026.
//

import SwiftUI

// MARK: - Model

struct Folder1: Identifiable, Hashable {
    let id: String
    let title: String
}

// MARK: - Root View

struct SwiftUIViewSwiftUIView: View {

    // MARK: - State

    @State private var selectedItemID: String?
    @State private var path = NavigationPath()

    // MARK: - Mock data

    private let folders: [Folder1] = [
        Folder1(id: "1", title: "Избранное"),
        Folder1(id: "2", title: "Документы"),
        Folder1(id: "3", title: "Архив")
    ]

    // MARK: - Body

    var body: some View {
        NavigationStack(path: $path) {
            List(folders) { folder in
                FolderRowView(
                    item: folder,
                    selectedItemID: $selectedItemID
                )
                .listRowBackground(
                    selectedItemID == folder.id
                    ? Color.red.opacity(0.2)     // 🔴 выделение
                    : Color.clear
                )
                .contentShape(Rectangle())
                .onTapGesture {
                    onTap(folder)
                }
            }
            .navigationTitle("Папки")
            .navigationDestination(for: Folder1.self) { folder in
                FolderDetailsView(folder: folder)
            }
            .onDisappear {
                selectedItemID = nil
            }
        }
    }

    // MARK: - Actions

    private func onTap(_ folder: Folder1) {
        withAnimation(.easeIn(duration: 0.15)) {
            selectedItemID = folder.id
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            path.append(folder)
        }
    }
}

// MARK: - Row View

struct FolderRowView: View {

    let item: Folder1
    @Binding var selectedItemID: String?

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "folder")
            Text(item.title)
        }
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Details View

struct FolderDetailsView: View {

    let folder: Folder1

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "folder.fill")
                .font(.system(size: 48))
                .foregroundColor(.red)

            Text(folder.title)
                .font(.title)
        }
        .navigationTitle(folder.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview

#Preview {
    SwiftUIViewSwiftUIView()
}
