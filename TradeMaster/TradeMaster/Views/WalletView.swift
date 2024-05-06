//
//  WalletView.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/4/24.
//

import SwiftUI

import SwiftUI

struct WalletView: View {
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager

    // Dummy data for demonstration
    let transactions = [
        Transaction(id: 1, title: "Deposit", amount: 500.00, date: Date()),
        Transaction(id: 2, title: "Withdrawal", amount: -200.00, date: Date())
        // Add more transactions as needed
    ]
    
    var body: some View {
        VStack {
            // Header
            HStack {
                Button(action: {
                    // Action for going back
                    let themeManager = ThemeManager() // Create an instance of ThemeManager
                    navigateToMainPage(themeManager: themeManager)
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                        .font(.title)
                }
                Spacer()
                Text("Wallet")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            
            // Balance Section
            VStack {
                Text("Your Balance")
                    .font(.headline)
                    .padding(.bottom, 4)
                Text("$1000.00")
                    .font(.title)
            }
            .padding()
            
            // Recent Transactions Section
            VStack(alignment: .leading) {
                Text("Recent Transactions")
                    .font(.headline)
                    .padding(.bottom, 4)
                
                ScrollView {
                    ForEach(transactions) { transaction in
                        TransactionRowView(transaction: transaction)
                    }
                }
                .padding(.horizontal)
            }
            
            // Buttons for Actions
            HStack {
                Spacer()
                Button(action: {
                    // Action for adding funds
                }) {
                    Text("Add Funds")
                        .padding()
                        .background(Color(UIColor.systemBlue))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                Spacer()
                Button(action: {
                    // Action for making a withdrawal
                }) {
                    Text("Withdraw")
                        .padding()
                        .background(Color(UIColor.systemRed))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}

struct Transaction: Identifiable {
    let id: Int
    let title: String
    let amount: Double
    let date: Date
}

struct TransactionRowView: View {
    let transaction: Transaction
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(transaction.title)
                    .font(.headline)
                Text(transaction.date, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("$\(String(format: "%.2f", transaction.amount))")
                .font(.headline)
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}
