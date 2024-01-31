//
//  HomeViewModel.swift
//  SwiftCoin
//
//  Created by loratech on 31/12/23.
//

import SwiftUI
@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]() 
    @Published var error: Error?
    
    private var pageLimit = 20
    private var page = 0
    
    let BASE_URL = "https://api.coingecko.com/api/v3/coins/"
    
    var urlString: String {
        return "\(BASE_URL)markets?vs_currency=usd&order=market_cap_desc&per_page=\(pageLimit)&page=\(page)&price_change_percentage=24h"
    }
     
    
    init() {
        loadData()
    }
}

extension HomeViewModel {
    @MainActor
    func fetchCoinsAsync() async throws {
        do {
            page += 1
            guard let url = URL(string: urlString) else {
                throw CoinError.invalidUrl
            }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                throw CoinError.serverError
            }
            guard let coins = try? JSONDecoder().decode([Coin].self, from: data) else {
                throw CoinError.invalidData
            }
            self.coins.append(contentsOf: coins)
        } catch {
            self.error = error
        }
    }
    
    func loadData() {
        Task(priority: .medium) {
            try await fetchCoinsAsync()
            configureTopMovingCoins()
        }
    }
    
    func handleRefresh() {
        coins.removeAll()
        loadData()
    }
}

extension HomeViewModel {
    @MainActor
    func fetchCoinData(){
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("DEBUG: error \(error.localizedDescription)")
                return
            }
            
            if let response = response as? HTTPURLResponse{
                print("DEBUG: Response code \(response.statusCode)")
            }
            
            guard let data else {return}
            
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                print("DEBUG: COINS \(coins)")
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovingCoins()
                }
            }catch let error {
                print("DEBUG: Failed to decode with error: \(error)")
            }
            
        }.resume()
    }
    
    func configureTopMovingCoins(){
        let topMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
        self.topMovingCoins = Array(topMovers.prefix(10))
    }
}

struct MockData {
    static let sampleCoin = Coin(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", currentPrice: 42436, marketCapRank: 1, marketCap: 831683372239, fullyDilutedValuation: 891712616320, totalVolume: 14537342806, high24H: 42838, low24H: 42053, priceChange24H: 382.92, priceChangePercentage24H: 0.91055, marketCapChange24H: 7490145707, marketCapChangePercentage24H: 0.90879, circulatingSupply: 19586300, totalSupply: 21000000, maxSupply: 21000000, ath: 69045, athChangePercentage: -38.50166, athDate: "2021-11-10T14:24:11.849Z", atl: 67.81, atlChangePercentage: 62519.105, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2024-01-01T03:26:24.264Z")
    
    static let sampleCoins = [Coin(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", currentPrice: 42436, marketCapRank: 1, marketCap: 831683372239, fullyDilutedValuation: 891712616320, totalVolume: 14537342806, high24H: 42838, low24H: 42053, priceChange24H: 382.92, priceChangePercentage24H: 0.91055, marketCapChange24H: 7490145707, marketCapChangePercentage24H: 0.90879, circulatingSupply: 19586300, totalSupply: 21000000, maxSupply: 21000000, ath: 69045, athChangePercentage: -38.50166, athDate: "2021-11-10T14:24:11.849Z", atl: 67.81, atlChangePercentage: 62519.105, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2024-01-01T03:26:24.264Z"),Coin(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", currentPrice: 42436, marketCapRank: 1, marketCap: 831683372239, fullyDilutedValuation: 891712616320, totalVolume: 14537342806, high24H: 42838, low24H: 42053, priceChange24H: 382.92, priceChangePercentage24H: 0.91055, marketCapChange24H: 7490145707, marketCapChangePercentage24H: 0.90879, circulatingSupply: 19586300, totalSupply: 21000000, maxSupply: 21000000, ath: 69045, athChangePercentage: -38.50166, athDate: "2021-11-10T14:24:11.849Z", atl: 67.81, atlChangePercentage: 62519.105, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2024-01-01T03:26:24.264Z"),Coin(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", currentPrice: 42436, marketCapRank: 1, marketCap: 831683372239, fullyDilutedValuation: 891712616320, totalVolume: 14537342806, high24H: 42838, low24H: 42053, priceChange24H: 382.92, priceChangePercentage24H: 0.91055, marketCapChange24H: 7490145707, marketCapChangePercentage24H: 0.90879, circulatingSupply: 19586300, totalSupply: 21000000, maxSupply: 21000000, ath: 69045, athChangePercentage: -38.50166, athDate: "2021-11-10T14:24:11.849Z", atl: 67.81, atlChangePercentage: 62519.105, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2024-01-01T03:26:24.264Z")]
}
