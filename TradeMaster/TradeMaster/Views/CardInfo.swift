//
//  CardInfo.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/3/24.
//

import SwiftUI

struct CardInfo: View {
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager
    @StateObject private var viewModel = CardModel()
    var message : String = ""
    @State private var showAlert = false // State variable to control the presentation of the alert
    @State private var alertMessage = "" // State variable to hold the message for the alert

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 30) {
                Button(action: {
                    navigateToAddingcard(themeManager: themeManager)
                }) {
                    Image(systemName: "arrow.left")
                        .font(Font.custom("Roboto", size: 20).weight(.medium))
                        .tracking(0.15)
                        .lineSpacing(20)
                        .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                        .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                }
                .padding(.horizontal, 16) // Adjusted horizontal padding
                .frame(maxWidth: .infinity, alignment: .leading) // Align to the leading edge
                VStack(alignment: .leading, spacing: 4) {
                    Text("Add card")
                        .font(Font.custom("Roboto", size: 32).weight(.bold))
                        .lineSpacing(32)
                        .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                        .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                    
                    Text("Enter your card info into the box below.")
                        .font(Font.custom("Roboto", size: 16))
                        .padding(.top, 8) // Adjusted top padding
                        .background(themeManager.currentTheme.sunBackgroundColor) // Apply background color
                        .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color
                }
              VStack(alignment: .leading, spacing: 2) {
                HStack(alignment: .top, spacing: 135) {
                  Text("Card Number")
                    .font(Font.custom("Roboto", size: 12))
                    .tracking(0.40)
                    .lineSpacing(16)
                    .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                    .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                }
                  FirebaseTextField(placeHolder: "0000 0000 0000 0000", text: $viewModel.cardno)

              }
              VStack(alignment: .leading, spacing: 2) {
                Text("Name on Card")
                  .font(Font.custom("Roboto", size: 14))
                  .tracking(0.40)
                  .lineSpacing(16)
                  .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                  .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                  
                  FirebaseTextField(placeHolder: "NAME ON CARD", text: $viewModel.name)
              }
                VStack(alignment: .leading, spacing: 2) {
                    Text("MM/YY")
                      .font(Font.custom("Roboto", size: 14))
                      .tracking(0.40)
                      .lineSpacing(16)
                      .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                      .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                      
                      FirebaseTextField(placeHolder: "00/00", text: $viewModel.mmyy)
                  }
                VStack(alignment: .leading, spacing: 2) {
                  Text("CVV")
                    .font(Font.custom("Roboto", size: 14))
                    .tracking(0.40)
                    .lineSpacing(16)
                    .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                    .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                    
                    FirebaseTextField(placeHolder: "Ex: 000", text: $viewModel.cvv)
                }
                Spacer().frame(height: 60)

                Button(action: {
                    if viewModel.mmyy.count != 5 || !viewModel.cardno.allSatisfy({ $0.isNumber }) {
                        // Show an alert or provide feedback to the user that the card number is invalid
                        alertMessage = "Please enter in the format MM/YY."
                        TradeMaster.showAlert(message: alertMessage)
                    } else
                    if viewModel.cardno.count != 16 || !viewModel.cardno.allSatisfy({ $0.isNumber }) {
                        // Show an alert or provide feedback to the user that the card number is invalid
                        alertMessage = "Please enter a 16-digit numeric card number."
                        TradeMaster.showAlert(message: alertMessage)
                    } else
                    if viewModel.cardno.isEmpty || viewModel.name.isEmpty || viewModel.mmyy.isEmpty || viewModel.cvv.isEmpty {
                            // Show an alert or provide feedback to the user that all fields are required
                            alertMessage = "Please fill in all fields."
                        TradeMaster.showAlert(message: alertMessage)
                    } else if viewModel.cvv.count != 3 || !viewModel.cvv.allSatisfy({ $0.isNumber }) {
                        // Show an alert or provide feedback to the user that the CVV is invalid
                        alertMessage = "Please enter a 3-digit numeric CVV."
                        TradeMaster.showAlert(message: alertMessage)
                    }else {
                        viewModel.storeCardDetailsInFirestore(viewModel: viewModel, themeManager: themeManager)
                        //                    navigateToCardlListView(themeManager: themeManager)
                    }
                }) {
                    HStack(spacing: 8) {
                        Text("Save")
                            .font(Font.custom("Roboto", size: 20).weight(.medium))
                            .tracking(0.10)
                            .lineSpacing(24)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.96))
                    }
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                }
                .frame(width: 358, height: 40)
                .background(Color(red: 0.07, green: 0.32, blue: 0.45))
                .cornerRadius(4)
            }
            .frame(width: 358, height: 220)
            Spacer().frame(height: 30)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(themeManager.currentTheme.sunBackgroundColor) // Apply background color
        .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color
        .background(Color.white)
        .ignoresSafeArea()

    }
}

#if DEBUG
struct CardInfo_Previews: PreviewProvider {
    static var previews: some View {
        CardInfo().environmentObject(ThemeManager()) // Provide the theme manager
    }
}
#endif
