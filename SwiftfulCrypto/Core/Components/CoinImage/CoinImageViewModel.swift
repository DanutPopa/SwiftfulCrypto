//
//  CoinImageViewModel.swift
//  SwiftfulCrypto
//
//  Created by Danut Popa on 28.04.2025.
//

import Foundation
import Combine
import SwiftUI

class CoinImageViewViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var isLoading = true
    
    private let coin: CoinModel
    private let dataService: CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink(receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
                self?.isLoading = false
            })
            .store(in: &cancellables)

    }
}
