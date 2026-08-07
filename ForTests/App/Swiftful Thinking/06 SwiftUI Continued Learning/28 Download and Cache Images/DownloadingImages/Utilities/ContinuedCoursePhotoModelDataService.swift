//
//  ContinuedCoursePhotoModelDataService.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Nick Sarno on 4/28/21.
//

import Foundation
import Combine

class ContinuedCoursePhotoModelDataService {
    
    static let instance = ContinuedCoursePhotoModelDataService() // Singleton
    
    @Published var photoModels: [ContinuedCoursePhotoModel] = []
    var cancellables = Set<AnyCancellable>()
    
    private init() {
        downloadData()
    }
    
    func downloadData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [ContinuedCoursePhotoModel].self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error downloading data. \(error)")
                }
            } receiveValue: { [weak self] (returnedPhotoModels) in
                self?.photoModels = returnedPhotoModels
            }
            .store(in: &cancellables)
    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
}
