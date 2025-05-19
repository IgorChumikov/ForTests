//
//  Folder.swift
//  ForTests
//
//  Created by Игорь Чумиков on 06.09.2024.
//

import Foundation

struct Folder: Identifiable {
    let id = UUID()
    var name: String
    var subfolders: [Folder]
}
