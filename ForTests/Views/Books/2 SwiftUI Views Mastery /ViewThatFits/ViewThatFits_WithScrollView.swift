//
//  ViewThatFits_WithScrollView.swift
//  ForTests
//
//  Created by Игорь Чумиков on 01.10.2025.
//

/*
Сначала пробует показать VStack напрямую.
Если список умещается на экране → скролл не нужен.
Если не помещается → автоматически используется ScrollView
*/

import SwiftUI

struct ViewThatFits_WithScrollView: View {
    var body: some View {
        ViewThatFits {
            repeatedDataView
            
            ScrollView {
                repeatedDataView
            }
        }
        .font(.largeTitle)
    }
    
    var repeatedDataView: some View {
        VStack {
            ForEach(0..<15) { index in
                Image(systemName: "\(index).circle")
                    .padding()
            }
        }
    }
}

#Preview {
    ViewThatFits_WithScrollView()
}
