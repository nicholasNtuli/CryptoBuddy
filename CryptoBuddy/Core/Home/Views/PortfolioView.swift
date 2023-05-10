//
//  PortfolioView.swift
//  CryptoBuddy
//
//  Created by Sihle Ntuli on 2023/05/09.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Environment(\.dismiss) var dismiss
    @State private var quantityText: String = ""
    @State private var showCheckmark: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchtext)
                    coinLogoList
                    
                    if vm.selectedCoin != nil {
                        portfolioInputSection
                    }
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton(dismiss: _dismiss)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    trailingNavBarButton
                }
            })
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(dev.homeVM)
    }
}


extension PortfolioView {
    
    private var coinLogoList: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHStack(spacing: 10) {
                ForEach(vm.allCoins) { coin in
                    CoinlogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapWithAnimation(.easeIn, {
                            vm.selectedCoin = coin
                        })
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(vm.selectedCoin?.id == coin.id ?  Color.theme.green : Color.clear, lineWidth: 1)
                        )
                }
            }
            .frame(height: 120)
            .padding(.leading)
        })
    }
    
    private func getCurrentValue() -> Double {
        if let quantity = Double(quantityText) {
            return quantity * (vm.selectedCoin?.currentPrice ?? 0)
        }
        return 0
    }
    
    private var portfolioInputSection: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Current price of \(vm.selectedCoin?.symbol.uppercased() ?? ""):")
                Spacer()
                Text(vm.selectedCoin?.currentPrice.asCurrencyWith6Decimals() ?? "")
            }
            
            Divider()
            
            HStack {
                Text("Amount holdings:")
                Spacer()
                TextField("Ex: 1.4", text: $quantityText)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            
            Divider()
            
            HStack {
                Text("Current value:")
                Spacer()
                Text(getCurrentValue().asCurrencyWith2Decimals())
            }
        }
        .onTapWithAnimation(.none, {})
        .padding()
        .font(.headline)
    }
    
    private var trailingNavBarButton: some View {
        HStack(spacing: 10) {
            Image(systemName: "checkmark")
                .opacity(showCheckmark ? 1.0 : 0.0)
            Button(action: {
                saveButtonPressed()
            }, label: {
                Text("Save".uppercased())
            })
            .opacity(
                (vm.selectedCoin != nil && vm.selectedCoin?.currentHoldings != Double(quantityText)) ? 1.0 : 0.0)
        }
        .font(.headline)
    }
    
    private func saveButtonPressed() {
        
        guard let coin = vm.selectedCoin else { return }
        
        ///Save to portfolio
        
        ///Show checkmark
        ///onTapWithAnimation(.easeIn {
        ///showCheckmark = true
        ///removeSelectedCoin()
        //})
        withAnimation(.easeIn) {
            showCheckmark = true
            removeSelectedCoin()
        }

        
        ///Hide keyboard
        UIApplication.shared.endEditing()
        
        ///Hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            //onTapWithAnimation(.easeOut, {
            //showCheckmark = false
            //
            //})
            withAnimation(.easeOut) {
                showCheckmark = false
            }
        }
    }
    
    private func removeSelectedCoin() {
        vm.selectedCoin = nil
        vm.searchtext = ""
    }
}
