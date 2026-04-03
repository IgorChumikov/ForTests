//
//  Color_Intro.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Color — это View

 • Color в SwiftUI — полноценный View.
 • Можно задавать размер через frame.
 • Можно применять модификаторы (clipShape и др.).
*/

import SwiftUI

struct Color_Intro: View {

    // MARK: - Body
    var body: some View {
        VStack(spacing: 40) {
            
            HeaderView3(
                title: "Color",
                subtitle: "Цвет — это View",
                desc: "Цвет можно использовать как обычный View с модификаторами.",
                back: .black,
                textColor: .white
            )
            
            HStack(spacing: 40) {
                
                // MARK: - Просто цвет
                Color.pink
                    .frame(width: 88, height: 88)
                
                // MARK: - Еще цвет
                Color.blue
                    .frame(width: 88, height: 88)
                
                // MARK: - Цвет с формой
                Color.purple
                    .frame(width: 88, height: 88)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
            Spacer()
        }
        .font(.title3)
    }
}

#Preview {
    Color_Intro()
}
