//
//  FavoriteBookmarkView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 17.03.2025.
//

import SwiftUI

struct FavoriteBookmarkView: View {
    @State private var text: String = """
    5. Документами, подтверждающими место оказания физическим лицам, \
    не являющимся индивидуальными предпринимателями, услуг, указанных \
    в пункте 1 статьи 174 2
    """

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Название закладки")
                .font(.headline)
            
            TextEditor(text: $text)
                .frame(height: 100)
                .padding(8)
                .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
        }
        .padding()
    }
}

#Preview {
    FavoriteBookmarkView()
}
