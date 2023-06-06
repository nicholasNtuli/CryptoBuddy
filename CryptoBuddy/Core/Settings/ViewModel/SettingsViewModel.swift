//
//  SettingsViewModel.swift
//  CryptoBuddy
//
//  Created by Sihle Ntuli on 2023/06/06.
//

import Foundation

class SettingsViwModel: ObservableObject {
    
    @Published var defaultURL = URL(string: "https://www.google.com")!
    @Published var coingeckoURL = URL(string: "https://www.coingecko.com")!
    @Published var personalURL = URL(string: "https://github.com/nicholasNtuli")!
    
}
