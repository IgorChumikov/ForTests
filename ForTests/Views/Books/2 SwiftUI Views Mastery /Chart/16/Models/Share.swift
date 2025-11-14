//
//  Share.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.10.2025.
//

import Foundation

// MARK: - Model
struct Share: Identifiable {
    let id = UUID()
    let label: String
    let value: Decimal

    static func fetchData() -> [Share] {
        [
            Share(label: "Reagan", value: 35),
            Share(label: "Rod", value: 20),
            Share(label: "Celina", value: 20),
            Share(label: "Tessa", value: 25)
        ]
    }
}
