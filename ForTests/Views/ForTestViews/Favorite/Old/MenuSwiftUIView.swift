////
////  MenuSwiftUIView.swift
////  ForTests
////
////  Created by Игорь Чумиков on 22.01.2025.
////
//
//import SwiftUI
//
//struct MenuSwiftUIView: View {
//    var body: some View {
//        Menu {
//            Button(action: selectFolders) {
//                Label("Выбрать", systemImage: "checkmark")
//            }
//            Divider()
//                .background(Color.gray.opacity(0.5))
//                .frame(height: 5)
//            Button(action: createFolderGroup) {
//                Label("Создать группу папок", systemImage: "folder.fill.badge.plus")
//            }
//            Button(action: createFolder) {
//                Label("Создать папку", systemImage: "folder.badge.plus")
//            }
//        } label: {
//            Image(systemName: "ellipsis.circle")
//                .imageScale(.large)
//        }
//    }
//    // Действия для пунктов меню
//    func createFolder() {
//        print("Создать папку")
//    }
//    
//    func createFolderGroup() {
//        print("Создать группу папок")
//    }
//    
//    func selectFolders() {
//        print("Выбрать папки")
//    }
//}
//
//#Preview {
//    MenuSwiftUIView()
//}
