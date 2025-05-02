//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by Danut Popa on 26.04.2025.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var statistics: [StatisticModel] = []
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText = ""
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        // updates allCoins
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        // updates marketData
        marketDataService.$marketData
            .map(mapGlobalMarketData)
            .sink { [weak self] returnedStats in
                self?.statistics = returnedStats
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard text.isEmpty == false
        else {
            return coins
        }
        
        return coins.filter { coin in
            coin.name.localizedCaseInsensitiveContains(text) ||
            coin.symbol.localizedCaseInsensitiveContains(text) ||
            coin.id.localizedCaseInsensitiveContains(text)
        }
    }
    
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?) -> [StatisticModel] {
        var stats: [StatisticModel] = []
        
        guard let marketDataModel
        else {
            return stats
        }
        
        let marketCap = StatisticModel(title: "Market Cap", value: marketDataModel.marketCap, percentageChange: marketDataModel.marketCapChangePercentage24HUsd)
        let volume = StatisticModel(title: "24h Volume", value: marketDataModel.volume)
        let btcDominance = StatisticModel(title: "BTC Dominance", value: marketDataModel.btcDominance)
        let portfolio = StatisticModel(title: "Portfolio Value", value: "€0.00", percentageChange: 0)
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        return stats
    }
    
}
