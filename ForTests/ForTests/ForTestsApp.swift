//
//  ForTestsApp.swift
//  ForTests
//
//  Created by Игорь Чумиков on 12.01.2024.
//

import SwiftUI

@main
struct ForTestsApp: App {
    @State private var rootFolder = Folder(name: "Root", subfolders: [])
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                FolderView(folder: $rootFolder)
            }
        }
    }
}
