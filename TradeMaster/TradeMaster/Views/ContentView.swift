//
//  ContentView.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/4/24.
//

import Kingfisher
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CoinsViewModel()
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager
    @State private var isSunTheme = true // Track the current theme (true for sun, false for moon)
    @StateObject private var log = SignInEmailViewModel()

    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(searchText: $viewModel.searchText)
                List {
                    ForEach(viewModel.displayedCoins) { coin in
                        NavigationLink (
                            destination: DetailView(coin: coin),
                            label: {
                                HStack(spacing: 10) {
                                    Text("\(coin.marketCapRank)")
                                        .foregroundColor(Color.themes.secondaryText)
                                    KFImage(coin.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                    
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(coin.name)
                                            .fontWeight(.semibold)
                                        
                                        Text(coin.symbol.uppercased())
                                    }
                                    
                                    Spacer()
                                    
                                    MiniChartView(coin: coin)
                                        .frame(width: 60, height: 40)
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing) {
                                        Text("$\(coin.currentPrice.asCurrencyWith6Decimals())")
                                            .bold()
                                        Text("\(coin.priceChangePercentage24H?.asPercentString() ?? "")")
                                            .foregroundColor((coin.priceChangePercentage24H ?? 0) >= 0 ? Color.themes.green : Color.themes.red)
                                    }
                                }
                                .font(.footnote)
                            }).tint(Color.themes.secondaryText)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle(Text("Coins"))
            .overlay {
                if let error = viewModel.errorMessage {
                    Text(error)
                }
            }
            .navigationBarItems(trailing:
                HStack {
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person.circle")
                    }
                NavigationLink(destination: WalletView()) {
                    Image(systemName: "wallet.pass")
                }
                Button(action: {
                    navigateToCardlListView(themeManager: themeManager)
                }) {
                        Image(systemName: "creditcard")
                    }
                    Button(action: {
                        // Action for signing out
                        Task{
                            do {
                                try log.logOut()
                                navigateToSignIn(themeManager: themeManager)
                            } catch {
                                print("Error signing out: \(error.localizedDescription)")
                            }
                        }
                    }) {
                        Text("Sign Out")
                    }
                }
            )
        }
    }
}

#Preview {
    NavigationView {
        ContentView()
    }
}
