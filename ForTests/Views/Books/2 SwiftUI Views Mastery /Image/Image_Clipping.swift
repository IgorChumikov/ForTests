//
//  Image_ClipShape.swift
//  ForTests
//
//  Created by Игорь Чумиков on 03.04.2026.
//

/*
 Clipping (Masking)

 • clipShape — обрезает View по форме (Shape).
 • Используется для маскирования изображения.
*/

import SwiftUI

struct Image_ClipShape: View {
    
    var body: some View {
        VStack(spacing: 5) {
            
            HeaderView3(
                title: "Image",
                subtitle: "Clipping (Маскирование)",
                desc: "Используйте модификатор clipShape, чтобы передать форму и обрезать изображение по ней.",
                back: .red,
                textColor: .primary
            )
            
            Text("Circle")
            Image("Fire")
                .clipShape(Circle())
            
            Text("Rounded Rectangle")
            Image("Fire")
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 10, x: 1, y: 1)
            
            Text("Capsule with Offset")
            Image("Fire")
                .clipShape(Capsule().offset(x: -80, y: 0))
        }
        .font(.title)
        .minimumScaleFactor(0.5)
    }
}

#Preview {
    Image_ClipShape()
}
