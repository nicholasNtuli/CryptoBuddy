//
//  SettingView.swift
//  CryptoBuddy
//
//  Created by Sihle Ntuli on 2023/06/06.
//

import SwiftUI

struct SettingView: View {
    
<<<<<<< Updated upstream
    let defaultURL = URL(string: "https://www.google.com")!
    let youtubeURL = URL(string: "https://www.youtube.com/c/swiftulthinking")!
    let coffeeURL = URL(string: "https://www.buymeacoffee.com/nicksarno")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://github.com/nicholasNtuli")!
=======
    @ObservedObject var vm: SettingsViwModel
>>>>>>> Stashed changes
    
    var body: some View {
        NavigationStack {
            List {
<<<<<<< Updated upstream
                swiftfulThinkingSection
                coinGeckoSection
=======
                aboutAppSection
                coinGeckoSection
                developerSection
                applicationSection
>>>>>>> Stashed changes
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    XMarkButton()
                }
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
<<<<<<< Updated upstream
        SettingView()
=======
        SettingView(vm: SettingsViwModel())
>>>>>>> Stashed changes
    }
}

extension SettingView {
    
<<<<<<< Updated upstream
    private var swiftfulThinkingSection: some View {
=======
    private var aboutAppSection: some View {
>>>>>>> Stashed changes
        Section(header: Text("Swiftful Thinking")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
<<<<<<< Updated upstream
                Text("This app was made by following a @SwiftfulThinking course on Youtube. It uses MVVM Architecture, Combine and CoreData")
=======
                Text("This app was made using the features such as MVVM Architecture, Combine and CoreData.")
>>>>>>> Stashed changes
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
<<<<<<< Updated upstream
            Link("Subscribe on Youtube", destination: youtubeURL)
            Link("Suport his addiction", destination: coffeeURL)
=======
>>>>>>> Stashed changes
        }
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame( height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be sightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
<<<<<<< Updated upstream
            Link("Visit CoinGecko", destination: coingeckoURL)
=======
            Link("Visit CoinGecko", destination: vm.coingeckoURL)
>>>>>>> Stashed changes
        }
    }
    
    private var developerSection: some View {
        Section(header: Text("Developer")) {
            VStack(alignment: .leading) {
<<<<<<< Updated upstream
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made by following a @SwiftfulThinking course on Youtube. It uses MVVM Architecture, Combine and CoreData")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Subscribe on Youtube", destination: personalURL)
=======
                HStack {
                    Image("seesh")
                        .resizable()
                        .scaledToFit()
                        .frame( height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    Text("This app was developed by Siphesihle Ntuli. It uses SwiftUI and is written in Swift. The project benefits from Multi-thrading, Publishers and Subscribers, and Data Persistance.")
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(Color.theme.accent)
                }
                .padding(.vertical)
            }
            Link("Github", destination: vm.personalURL)
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("Application")) {
            Link("Terms and Conditions", destination: vm.personalURL)
            Link("Privacy Policy", destination: vm.personalURL)
            Link("Company Website", destination: vm.personalURL)
            Link("Learn More", destination: vm.personalURL)
>>>>>>> Stashed changes
        }
    }
}
