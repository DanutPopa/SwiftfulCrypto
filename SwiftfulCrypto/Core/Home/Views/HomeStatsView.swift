//
//  HomeStatsView.swift
//  SwiftfulCrypto
//
//  Created by Danut Popa on 01.05.2025.
//

import SwiftUI

struct HomeStatsView: View {
    @EnvironmentObject private var viewModel: HomeViewModel
    @Binding var showPortfolio: Bool
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                ForEach(viewModel.statistics) { stat in
                    StatisticView(stat: stat)
                        .frame(width: geometry.size.width / 3)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .frame(width: geometry.size.width,
                   alignment: showPortfolio ? .trailing : .leading)
        }
        .frame(height: 70)
    }
}

#Preview {
    HomeStatsView(showPortfolio: .constant(false))
        .environmentObject(DeveloperPreview.instance.homeViewModel)
}
