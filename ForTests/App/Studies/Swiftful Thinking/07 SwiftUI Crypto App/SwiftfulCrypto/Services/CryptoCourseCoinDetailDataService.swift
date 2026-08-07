//
//  CryptoCourseCoinDetailDataService.swift
//  SwiftfulCrypto
//
//  Created by Nick Sarno on 5/11/21.
//

import Foundation
import Combine

class CryptoCourseCoinDetailDataService {
    
    @Published var coinDetails: CryptoCourseCoinDetailModel? = nil
    
    var coinDetailSubscription: AnyCancellable?
    let coin: CryptoCourseCoinModel
    
    init(coin: CryptoCourseCoinModel) {
        self.coin = coin
        getCoinDetails()
    }
    
    func getCoinDetails() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else { return }

        coinDetailSubscription = CryptoCourseNetworkingManager.download(url: url)
            .decode(type: CryptoCourseCoinDetailModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: CryptoCourseNetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoinDetails) in
                self?.coinDetails = returnedCoinDetails
                self?.coinDetailSubscription?.cancel()
            })
    }
    
}
