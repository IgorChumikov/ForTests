//
//  BookmarkItem.swift
//  ForTests
//
//  Created by Игорь Чумиков on 16.06.2025.
//

import Foundation

struct BookmarkItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let comment: String
}

let mockBookmarks: [BookmarkItem] = [
    BookmarkItem(
        title: "Налоговый кодекс Российской Федерации (часть вторая) от 05.08.2000 N 117-ФЗ (ред. от 17.10.2024)",
        subtitle: "Мои закладки / Избранное с Samsung Galaxy Tab A9+",
        comment: "Важный налоговый документ"
    ),
    BookmarkItem(
        title: "5. Документами, подтверждающими место оказания физическим лицам...",
        subtitle: "Мои закладки / Майские заседания 2016",
        comment: "Проверить перед подачей декларации"
    ),
    BookmarkItem(
        title: "Статья 9. Понятие льгот для кормящих матерей",
        subtitle: "Не забыть стать кормящей матерью...",
        comment: "Посмеяться позже 😄"
    ),
    BookmarkItem(
        title: "5. Документами, подтверждающими место оказания физическим лицам...",
        subtitle: "Мои закладки / Майские заседания 2016",
        comment: "Проверить перед подачей декларации"
    ),
    BookmarkItem(
        title: "Статья 9. Понятие льгот для кормящих матерей",
        subtitle: "Не забыть стать кормящей матерью...",
        comment: "Посмеяться позже 😄"
    ),
    BookmarkItem(
        title: "5. Документами, подтверждающими место оказания физическим лицам...",
        subtitle: "Мои закладки / Майские заседания 2016",
        comment: "Проверить перед подачей декларации"
    ),
    BookmarkItem(
        title: "Статья 9. Понятие льгот для кормящих матерей",
        subtitle: "Не забыть стать кормящей матерью...",
        comment: "Посмеяться позже 😄"
    ),
]
