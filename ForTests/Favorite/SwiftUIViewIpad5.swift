//
//  SwiftUIViewIpad5.swift
//  ForTests
//
//  Created by Игорь Чумиков on 22.01.2025.
//

import SwiftUI


struct SwiftUIViewIpad5: View {
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Image(systemName: "folder.fill")
                        .foregroundColor(.orange)
                    Text("Новая папка 1")
                }
                HStack {
                    Image(systemName: "folder.fill")
                        .foregroundColor(.blue)
                    Text("Новая папка 4")
                }
            }
            .navigationTitle("Папки")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button(action: createFolder) {
                            Label("Создать папку", systemImage: "folder.badge.plus")
                        }
                        Button(action: createFolderGroup) {
                            Label("Создать группу папок", systemImage: "folder.fill.badge.plus")
                        }
                        Button(action: selectFolders) {
                            Label("Выбрать", systemImage: "checkmark")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .imageScale(.large)
                    }
                }
            }
        }
    }
    
    // Действия для пунктов меню
    func createFolder() {
        print("Создать папку")
    }
    
    func createFolderGroup() {
        print("Создать группу папок")
    }
    
    func selectFolders() {
        print("Выбрать папки")
    }
}

#Preview {
    SwiftUIViewIpad5()
}
