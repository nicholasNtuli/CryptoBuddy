//
//  MarketDataService.swift
//  CryptoBuddy
//
//  Created by Sihle Ntuli on 2023/05/09.
//

import Foundation
import Combine

class MarketDataService {
    
    @Published var marketData: MarketDataModel? = nil
    
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    func getData() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
  
        marketDataSubscription = NetworkingManager.download(url: url)
            /// Download in the background thread
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            /// Back on the main thread
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedGlobalData) in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel()
            })
    }
    
}
