//
//  CoinImageView.swift
//  SwiftfulCrypto
//
//  Created by Danut Popa on 28.04.2025.
//

import SwiftUI

struct CoinImageView: View {
    @StateObject private var viewModel: CoinImageViewViewModel

    init(coin: CoinModel) {
        _viewModel = StateObject(wrappedValue: CoinImageViewViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if viewModel.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundStyle(Color.theme.secondaryText)
            }
        }
    }
}

#Preview {
    CoinImageView(coin: DeveloperPreview.instance.coin)
}
