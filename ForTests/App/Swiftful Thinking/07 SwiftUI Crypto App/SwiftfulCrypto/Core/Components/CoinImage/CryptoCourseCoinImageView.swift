//
//  CryptoCourseCoinImageView.swift
//  SwiftfulCrypto
//
//  Created by Nick Sarno on 5/9/21.
//

import SwiftUI

struct CryptoCourseCoinImageView: View {
    
    @StateObject var vm: CryptoCourseCoinImageViewModel
    
    init(coin: CryptoCourseCoinModel) {
        _vm = StateObject(wrappedValue: CryptoCourseCoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct CryptoCourseCoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoCourseCoinImageView(coin: dev.coin)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
