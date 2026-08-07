//
//  ContinuedCourseTypealiasBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Nick Sarno on 4/9/21.
//

import SwiftUI

struct ContinuedCourseMovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = ContinuedCourseMovieModel

struct ContinuedCourseTypealiasBootcamp: View {
    
    //@State var item: ContinuedCourseMovieModel = ContinuedCourseMovieModel(title: "Title", director: "Joe", count: 5)
    @State var item: TVModel = TVModel(title: "TV Title", director: "Emmily", count: 10)
    
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

struct ContinuedCourseTypealiasBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ContinuedCourseTypealiasBootcamp()
    }
}
