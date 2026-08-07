//
//  CryptoCourseCoinImageViewModel.swift
//  SwiftfulCrypto
//
//  Created by Nick Sarno on 5/9/21.
//

import Foundation
import SwiftUI
import Combine

class CryptoCourseCoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let coin: CryptoCourseCoinModel
    private let dataService: CryptoCourseCoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CryptoCourseCoinModel) {
        self.coin = coin
        self.dataService = CryptoCourseCoinImageService(coin: coin)
        self.addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
        
    }
    
}
