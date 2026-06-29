//
//  FolderView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.09.2024.
//

import SwiftUI

struct FolderView: View {
    @Binding var folder: Folder
    @State private var isAddingFolder = false
    @State private var newFolderName = ""

    var body: some View {
        List {
            ForEach(folder.subfolders) { subfolder in
                NavigationLink(destination: FolderView(folder: binding(for: subfolder))) {
                    Text(subfolder.name)
                }
            }
            .onDelete(perform: deleteSubfolder)
        }
        .navigationTitle(folder.name)
        .navigationBarItems(trailing: Button("Add Folder") {
            isAddingFolder = true
        })
        .sheet(isPresented: $isAddingFolder) {
            VStack {
                TextField("Folder Name", text: $newFolderName)
                Button("Add") {
                    addSubfolder()
                }
            }
            .padding()
        }
    }

    private func binding(for subfolder: Folder) -> Binding<Folder> {
        guard let index = folder.subfolders.firstIndex(where: { $0.id == subfolder.id }) else {
            fatalError("Subfolder not found")
        }
        return $folder.subfolders[index]
    }

    private func addSubfolder() {
        folder.subfolders.append(Folder(name: newFolderName, subfolders: []))
        newFolderName = ""
        isAddingFolder = false
    }

    private func deleteSubfolder(at offsets: IndexSet) {
        folder.subfolders.remove(atOffsets: offsets)
    }
}

#Preview {
    FolderView(folder: .constant(.init(name: "Folder", subfolders: [Folder(name: "", subfolders: .init())])))
}
