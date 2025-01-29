//
//  BookmarksList.swift
//  ForTests
//
//  Created by Игорь Чумиков on 29.01.2025.
//

import SwiftUI

// MARK: - Модель
struct BookmarksList: Codable {
    let list: [Bookmark]
    let from: Int
    let total: Int
}

struct Bookmark: Identifiable, Codable {
    let id: String
    let type: BookmarksType
    let time: Date
    let parent_id: String?
    let url: String?
    let title: String?
    let edition: String?
    let edition_date: String?
    let base: String?
    let docnumber: Int?
    let lasted: Bool?
    let name: String?
    let comment: String?
    let paragraph: Int?
    let page: String?
    let label: Int?
    let offset: Int?
}

enum BookmarksType: String, Codable {
    case document
    case bookmark
    case folder
}

// MARK: - Моки данных
extension BookmarksList {
    static let mock: BookmarksList = BookmarksList(
        list: [
            Bookmark(id: "1", type: .folder, time: Date(), parent_id: nil, url: nil, title: nil, edition: nil, edition_date: nil, base: nil, docnumber: nil, lasted: nil, name: "Избранное с Samsung Galaxy Tab A9+", comment: nil, paragraph: nil, page: nil, label: nil, offset: nil),
            Bookmark(id: "2", type: .folder, time: Date(), parent_id: nil, url: nil, title: nil, edition: nil, edition_date: nil, base: nil, docnumber: nil, lasted: nil, name: "Нимущественные вычеты (для дела Виктора Анатольевича)", comment: nil, paragraph: nil, page: nil, label: nil, offset: nil),
            Bookmark(id: "3", type: .document, time: Date(), parent_id: nil, url: "https://example.com", title: "Налоговый кодекс Российской Федерации (часть первая) от 31.07.1998 N 146-ФЗ", edition: "v1", edition_date: "19.02.2018", base: "НК РФ", docnumber: 146, lasted: false, name: nil, comment: "Статья 8. Понятие налога, сбора, страховых взносов", paragraph: nil, page: nil, label: nil, offset: nil),
            Bookmark(id: "4", type: .document, time: Date(), parent_id: nil, url: "https://example.com", title: "О применении ККТ плательщиками налога при ПСН и ЕНВД", edition: "n1", edition_date: "14.05.2018", base: "Письмо Минфина", docnumber: 32165, lasted: false, name: nil, comment: "Письмо Минфина России от 14.05.2018", paragraph: nil, page: nil, label: nil, offset: nil)
        ],
        from: 0,
        total: 4
    )
}

