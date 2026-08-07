//
//  ContinuedCourseDownloadingImagesViewModel.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Nick Sarno on 4/28/21.
//

import Foundation
import Combine

class ContinuedCourseDownloadingImagesViewModel: ObservableObject {
    
    @Published var dataArray: [ContinuedCoursePhotoModel] = []
    var cancellables = Set<AnyCancellable>()

    let dataService = ContinuedCoursePhotoModelDataService.instance
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$photoModels
            .sink { [weak self] (returnedPhotoModels) in
                self?.dataArray = returnedPhotoModels
            }
            .store(in: &cancellables)
    }
    
}
