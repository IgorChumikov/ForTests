//
//  ContinuedCourseDownloadingImagesBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Nick Sarno on 4/28/21.
//

import SwiftUI

// Codable
// background threads
// weak self
// Combine
// Publishers and Subscribers
// FileManager
// NSCache

struct ContinuedCourseDownloadingImagesBootcamp: View {
    
    @StateObject var vm = ContinuedCourseDownloadingImagesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.dataArray) { model in
                    ContinuedCourseDownloadingImagesRow(model: model)
                }
            }
            .navigationTitle("Downloading Images!")
        }
    }
}

struct ContinuedCourseDownloadingImagesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ContinuedCourseDownloadingImagesBootcamp()
    }
}
