//
//  SwiftUITestingView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 04.03.2025.
//

import SwiftUI

struct SwiftUITestingView: View {
    
    let text: String
    
    var body: some View {
        annotation
    }
    
    private var annotation: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(text)
                .lineSpacing(3)
            expandButton
            
        }
    }
    
    private var expandButton: some View {
        Button {
            // some code
        } label: {
            HStack(alignment: .center, spacing: 4) {
                Image(systemName: "arrow.down")
                Text("Развернуть")
            }
            .foregroundColor(.blue)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    SwiftUITestingView(
        text: "Дополнены положения о личном фонде. Уточнены нормы о ликвидации общественно полезного фонда в случае осуществления деятельности, противоречающией уставным целям. Дополнены положения о личном фонде. Уточнены нормы о ликвидации общественно полезного фонда в случае осуществления деятельности, противоречающией уставным целям."
    )
}
