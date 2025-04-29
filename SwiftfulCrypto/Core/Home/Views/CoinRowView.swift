//
//  CoinRowView.swift
//  SwiftfulCrypto
//
//  Created by Danut Popa on 25.04.2025.
//

import SwiftUI

struct CoinRowView: View {
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                leftColumn
                Spacer()
                if showHoldingsColumn {
                    centerColumn
                        .foregroundStyle(Color.theme.accent)
                }
                
                rightColumn
                    .frame(width: geometry.size.width / 3.5, alignment: .trailing)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .font(.subheadline)
            
        }
    }
}

#Preview {
    CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingsColumn: true)
}

extension CoinRowView {
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.theme.accent)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWithDecimals(2, numberStyle: .currency))
                .bold()
            Text((coin.currentHoldings ?? 0).asCurrencyWithDecimals(2, numberStyle: .none))
        }
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWithDecimals(4, numberStyle: .currency))
                .bold()
                .foregroundStyle(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asCurrencyWithDecimals(2, numberStyle: .percent) ?? "")
                .foregroundStyle(
                    (coin.priceChangePercentage24H ?? 0) >= 0
                    ? Color.theme.green
                    : Color.theme.red
                )
        }
    }
}
