//
//  GroupInfo.swift
//  ForTests
//
//  Created by Игорь Чумиков on 09.10.2025.
//

import Foundation

// MARK: - Model
struct GroupInfo: Identifiable {
    let id = UUID()
    let x: String       // категория (ось X)
    let y: Double       // значение (ось Y)
    let group: String   // группа для цвета

    // Пример данных
    static func fetchData() -> [GroupInfo] {
        [
            GroupInfo(x: "Q1", y: 120, group: "iOS"),
            GroupInfo(x: "Q1", y: 80,  group: "Android"),
            GroupInfo(x: "Q2", y: 150, group: "iOS"),
            GroupInfo(x: "Q2", y: 100, group: "Android"),
            GroupInfo(x: "Q3", y: 170, group: "iOS"),
            GroupInfo(x: "Q3", y: 110, group: "Android"),
            GroupInfo(x: "Q4", y: 130, group: "iOS"),
            GroupInfo(x: "Q4", y: 90,  group: "Android")
        ]
    }
}
