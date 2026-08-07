//
//  CryptoCourseHomeStatsView.swift
//  SwiftfulCrypto
//
//  Created by Nick Sarno on 5/9/21.
//

import SwiftUI

struct CryptoCourseHomeStatsView: View {
    
    @EnvironmentObject private var vm: CryptoCourseHomeViewModel
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statistics) { stat in
                CryptoCourseStatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               alignment: showPortfolio ? .trailing : .leading
        )
    }
}

struct CryptoCourseHomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoCourseHomeStatsView(showPortfolio: .constant(false))
            .environmentObject(dev.homeVM)
    }
}
