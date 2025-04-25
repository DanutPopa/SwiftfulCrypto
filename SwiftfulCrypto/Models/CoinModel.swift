//
//  CoinModel.swift
//  SwiftfulCrypto
//
//  Created by Danut Popa on 24.04.2025.
//

import Foundation

//CoinGecko API info
/*
 
 URL:
 https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&x_cg_demo_api_key=CG-o59LobWMMrirv22jKxRfsqNK
 
 JSON Response: 
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
     "current_price": 81556,
     "market_cap": 1619340631866,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 1619340631866,
     "total_volume": 30235463244,
     "high_24h": 83112,
     "low_24h": 80701,
     "price_change_24h": -732.419104980145,
     "price_change_percentage_24h": -0.89007,
     "market_cap_change_24h": -14742387014.9104,
     "market_cap_change_percentage_24h": -0.90218,
     "circulating_supply": 19855500,
     "total_supply": 19855500,
     "max_supply": 21000000,
     "ath": 105495,
     "ath_change_percentage": -22.64995,
     "ath_date": "2025-01-20T07:16:25.271Z",
     "atl": 51.3,
     "atl_change_percentage": 158970.26802,
     "atl_date": "2013-07-05T00:00:00.000Z",
     "roi": null,
     "last_updated": "2025-04-24T14:01:01.534Z",
     "sparkline_in_7d": {
       "price": [84671.3125974674, 84752.8109555216]
     },
     "price_change_percentage_24h_in_currency": -0.890066889509942
   }
 
 */
struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double {
        (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        Int(marketCapRank ?? 0)
    }
    
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}


