////
////  BookmarksList.swift
////  ForTests
////
////  Created by Игорь Чумиков on 29.01.2025.
////
//
//import SwiftUI
//
//// MARK: - Модель
//struct BookmarksList: Codable {
//    let list: [Bookmark]
//    let from: Int
//    let total: Int
//}
//
//struct Bookmark: Identifiable, Codable {
//    let id: String
//    let type: BookmarksType
//    let time: Date
//    let parent_id: String?
//    let url: String?
//    let title: String?
//    let edition: String?
//    let edition_date: String?
//    let base: String?
//    let docnumber: Int?
//    let lasted: Bool?
//    let name: String?
//    let comment: String?
//    let paragraph: Int?
//    let page: String?
//    let label: Int?
//    let offset: Int?
//}
//
//enum BookmarksType: String, Codable {
//    case document
//    case bookmark
//    case folder
//}
//
//// MARK: - Моки данных
//extension BookmarksList {
//    static let mock: BookmarksList = BookmarksList(
//        list: [
//            Bookmark(id: "1", type: .folder, time: Date(), parent_id: nil, url: nil, title: nil, edition: nil, edition_date: nil, base: nil, docnumber: nil, lasted: nil, name: "Избранное", comment: nil, paragraph: nil, page: nil, label: nil, offset: nil),
//            
//            // Трудовой кодекс РФ
//            Bookmark(id: "10", type: .document, time: Date(), parent_id: nil, url: "https://example.com", title: "Трудовой кодекс Российской Федерации от 30.12.2001 N 197-ФЗ (ред. от 26.12.2024)", edition: "ред. от 26.12.2024", edition_date: "26.12.2024", base: "ТК РФ", docnumber: 197, lasted: false, name: nil, comment: nil, paragraph: nil, page: nil, label: nil, offset: nil),
//            Bookmark(id: "11", type: .bookmark, time: Date(), parent_id: "10", url: nil, title: nil, edition: nil, edition_date: nil, base: nil, docnumber: nil, lasted: nil, name: "Статья 13. Действие трудового законодательства", comment: nil, paragraph: nil, page: nil, label: nil, offset: nil),
//            Bookmark(id: "12", type: .bookmark, time: Date(), parent_id: "10", url: nil, title: nil, edition: nil, edition_date: nil, base: nil, docnumber: nil, lasted: nil, name: "Статья 14. Исчисление сроков", comment: nil, paragraph: nil, page: nil, label: nil, offset: nil),
//
//            // Уголовный кодекс РФ
//            Bookmark(id: "20", type: .document, time: Date(), parent_id: nil, url: "https://example.com", title: "Уголовный кодекс Российской Федерации от 13.06.1996 N 63-ФЗ (ред. от 28.12.2024)", edition: "ред. от 28.12.2024", edition_date: "28.12.2024", base: "УК РФ", docnumber: 63, lasted: false, name: nil, comment: nil, paragraph: nil, page: nil, label: nil, offset: nil),
//            Bookmark(id: "21", type: .bookmark, time: Date(), parent_id: "20", url: nil, title: nil, edition: nil, edition_date: nil, base: nil, docnumber: nil, lasted: nil, name: "Статья 1. Уголовное законодательство Российской Федерации", comment: nil, paragraph: nil, page: nil, label: nil, offset: nil),
//            Bookmark(id: "22", type: .bookmark, time: Date(), parent_id: "20", url: nil, title: nil, edition: nil, edition_date: nil, base: nil, docnumber: nil, lasted: nil, name: "Статья 2. Задачи Уголовного кодекса Российской Федерации", comment: nil, paragraph: nil, page: nil, label: nil, offset: nil),
//
//            // Арбитражный процессуальный кодекс РФ
//            Bookmark(id: "30", type: .document, time: Date(), parent_id: nil, url: "https://example.com", title: "Арбитражный процессуальный кодекс Российской Федерации от 24.07.2002 N 95-ФЗ (ред. от 28.12.2024)", edition: "ред. от 28.12.2024", edition_date: "28.12.2024", base: "АПК РФ", docnumber: 95, lasted: false, name: nil, comment: nil, paragraph: nil, page: nil, label: nil, offset: nil),
//            Bookmark(id: "31", type: .bookmark, time: Date(), parent_id: "30", url: nil, title: nil, edition: nil, edition_date: nil, base: nil, docnumber: nil, lasted: nil, name: "Статья 31. Компетенция арбитражных судов", comment: nil, paragraph: nil, page: nil, label: nil, offset: nil),
//            Bookmark(id: "32", type: .bookmark, time: Date(), parent_id: "30", url: nil, title: nil, edition: nil, edition_date: nil, base: nil, docnumber: nil, lasted: nil, name: "Статья 32. Компетенция арбитражных судов", comment: nil, paragraph: nil, page: nil, label: nil, offset: nil)
//        ],
//        from: 0,
//        total: 4
//    )
//}
//
