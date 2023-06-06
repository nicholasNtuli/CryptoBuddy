//
//  SettingView.swift
//  CryptoBuddy
//
//  Created by Sihle Ntuli on 2023/06/06.
//

import SwiftUI

struct SettingView: View {
    
    @ObservedObject var vm: SettingsViwModel
    
    var body: some View {
        NavigationStack {
            List {
                aboutAppSection
                coinGeckoSection
                developerSection
                applicationSection
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
        SettingView(vm: SettingsViwModel())
    }
}

extension SettingView {
    
    private var aboutAppSection: some View {
        Section(header: Text("Swiftful Thinking")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made using the features such as MVVM Architecture, Combine and CoreData.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
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
            Link("Visit CoinGecko", destination: vm.coingeckoURL)
        }
    }
    
    private var developerSection: some View {
        Section(header: Text("Developer")) {
            VStack(alignment: .leading) {
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
        }
    }
}
