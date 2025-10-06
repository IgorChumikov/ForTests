//
//  QuickSearchListFoundDocuments.swift
//  ForTests
//
//  Created by Игорь Чумиков on 27.05.2024.
//

import SwiftUI

struct QuickSearchListFoundDocuments: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ScrollView {
                foundDocument
                textHint
                textHint
            }
        }
    }
    
    private var foundDocument: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Статья 4. Договор участия в долевом строительстве")
                .foregroundColor(.blue)
            Text("Ф3 от 30.12.2004 N 214-ФЗ Об участии в долевом строительстве многоквартирных домов и иных объектов недвижимости и о внесении изменений в некоторые законодательные акты Российской Федерации от 30.12.2004 N 214-ФЗ (последняя редакция)")
        }
        .padding(.horizontal, 16)
    }
    
    private var textHint: some View {
        HStack(alignment: .center, spacing: .zero) {
            Text("ДДУ")
            Spacer()
            Image(systemName: "arrowshape.up.fill")
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    QuickSearchListFoundDocuments()
}
