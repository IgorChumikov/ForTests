//
//  CryptoCourseCoinLogoView.swift
//  SwiftfulCrypto
//
//  Created by Nick Sarno on 5/9/21.
//

import SwiftUI

struct CryptoCourseCoinLogoView: View {
    
    let coin: CryptoCourseCoinModel
    
    var body: some View {
        VStack {
            CryptoCourseCoinImageView(coin: coin)
                .frame(width: 50, height: 50)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(Color.theme.accent)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Text(coin.name)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
        }
    }
}

struct CryptoCourseCoinLogoView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            CryptoCourseCoinLogoView(coin: dev.coin)
                .previewLayout(.sizeThatFits)

            CryptoCourseCoinLogoView(coin: dev.coin)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
