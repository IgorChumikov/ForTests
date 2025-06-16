//
//  BookmarksDocumentMenuSwiftUIView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 16.06.2025.
//

import SwiftUI

struct BookmarksDocumentMenuSwiftUIView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Закладки")
                .font(.title2.bold())
                .padding(.horizontal)
                .padding(.top)

            List(mockBookmarks) { bookmark in
                VStack(alignment: .leading, spacing: 4) {
                    Text(bookmark.title)
                        .font(.body)
                        .foregroundColor(.primary)
                        .lineLimit(5)

                    Text(bookmark.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    BookmarksDocumentMenuSwiftUIView()
}
