//
//  CardlListView.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/3/24.
//

import SwiftUI

struct CardlListView: View {
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager
    @State private var cards: [Card] = [] // Assuming Card is a struct representing your card data
    @StateObject var cardmodel = CardModel() // Create an instance of CardModel

    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading, spacing: 16) {
                Button(action: {
                    // Action for going back
                    let themeManager = ThemeManager() // Create an instance of ThemeManager
                    navigateToMainPage(themeManager: themeManager)
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                        .font(.title)
                }
                Spacer().frame(height: 40)
                HStack(spacing: 8) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color(red: 0.23, green: 0.69, blue: 0.40))
                        .font(Font.system(size: 24))
                    
                    Text("Successfully added cards")
                        .font(Font.custom("Roboto", size: 14))
                        .tracking(0.25)
                        .lineSpacing(20)
                        .foregroundColor(Color(red: 0.23, green: 0.69, blue: 0.40))
                }
                .padding(16)
                .frame(width: 358, height: 56)
                .background(Color(red: 0.23, green: 0.69, blue: 0.40).opacity(0.20))
                .cornerRadius(4)
                
                
                Text("Cards list")
                    .font(Font.custom("Roboto", size: 32).weight(.bold))
                    .lineSpacing(32)
                    .foregroundColor(themeManager.currentTheme.sunTextColor)
                    .background(themeManager.currentTheme.sunBackgroundColor)
                
                VStack(spacing: 20) {
                    ForEach(cards) { card in
                        HStack {
                            Image(systemName: "creditcard.fill") // Add card icon
                                .foregroundColor(.blue) // Customize icon color as needed
                            Text(maskedCardNumber(card.cardNumber))
                                .foregroundColor(.gray)
                                .padding(.horizontal, 10) // Add some horizontal padding to the text
                        }
                    }
                    Spacer() // Add Spacer here to push the button to the bottom
                }
                
                Button(action: {
                    // Action when the button is tapped
                    navigateToCardInfo(themeManager: themeManager)
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                        
                        Text("Add your card")
                            .font(Font.custom("Roboto", size: 28).weight(.black))
                            .tracking(0.10)
                            .lineSpacing(24)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.96))
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 16))
                    }
                }
                .frame(width: 358, height: 40)
                .background(Color(red: 0.07, green: 0.32, blue: 0.45))
                .cornerRadius(4)
                
                Spacer().frame(height: 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(themeManager.currentTheme.sunBackgroundColor)
            .foregroundColor(themeManager.currentTheme.sunTextColor)
            .background(Color.white)
            .ignoresSafeArea()
            .onAppear {
                // Fetch cards from the database when the view appears
                // Call the fetchUserCards function when the view appears
                cardmodel.fetchUserCards { fetchedCards in
                    // Update the state variable holding the cards
                    self.cards = fetchedCards
                }
            }
        }
    }
    // Function to mask the card number
    func maskedCardNumber(_ cardNumber: String) -> String {
        guard cardNumber.count >= 16 else {
            return cardNumber
        }
        
        let maskedPart = String(repeating: "•", count: cardNumber.count - 4)
        let visiblePart = String(cardNumber.suffix(4))
        
        return maskedPart + visiblePart
    }
}

#if DEBUG
struct CardlListView_Previews: PreviewProvider {
    static var previews: some View {
        CardlListView().environmentObject(ThemeManager()) // Provide the theme manager
    }
}
#endif
