//
//  ContinuedCourseHashableBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Nick Sarno on 4/2/21.
//

import SwiftUI

struct ContinuedCourseMyCustomModel: Hashable {
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

struct ContinuedCourseHashableBootcamp: View {
    
    let data: [ContinuedCourseMyCustomModel] = [
        ContinuedCourseMyCustomModel(title: "ONE"),
        ContinuedCourseMyCustomModel(title: "TWO"),
        ContinuedCourseMyCustomModel(title: "THREE"),
        ContinuedCourseMyCustomModel(title: "FOUR"),
        ContinuedCourseMyCustomModel(title: "FIVE"),
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                ForEach(data, id: \.self) { item in
                    Text(item.hashValue.description)
                        .font(.headline)
                }
            }
        }
    }
}

struct ContinuedCourseHashableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ContinuedCourseHashableBootcamp()
    }
}
