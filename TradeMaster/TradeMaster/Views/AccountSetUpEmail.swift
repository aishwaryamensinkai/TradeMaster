//
//  AccountSetUpEmail.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/3/24.
//

import SwiftUI

struct AccountSetUpEmail: View {
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager
    @StateObject private var viewModel = UserDetailsModel()
    var message : String = ""
    @State private var showAlert = false // State variable to control the presentation of the alert
    @State private var alertMessage = "" // State variable to hold the message for the alert

    var body: some View {
        VStack {
            Spacer().frame(height: 20)
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Add your personal info")
                        .font(Font.custom("Roboto", size: 32).weight(.bold))
                        .lineSpacing(32)
                        .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                        .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                    
                    Text("This info needs to be accurate with you")
                        .font(Font.custom("Roboto", size: 15))
                        .padding(.top, 8) // Adjusted top padding
                        .background(themeManager.currentTheme.sunBackgroundColor) // Apply background color
                        .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color
                    Text("ID document.")
                        .font(Font.custom("Roboto", size: 15))
                        .background(themeManager.currentTheme.sunBackgroundColor) // Apply background color
                        .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color
                }
              VStack(alignment: .leading, spacing: 2) {
                HStack(alignment: .top, spacing: 135) {
                  Text("Full Name")
                    .font(Font.custom("Roboto", size: 12))
                    .tracking(0.40)
                    .lineSpacing(16)
                    .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                    .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                }
                  FirebaseTextField(placeHolder: "Enter your full name", text: $viewModel.fullname)

              }
              VStack(alignment: .leading, spacing: 2) {
                Text("Username")
                  .font(Font.custom("Roboto", size: 14))
                  .tracking(0.40)
                  .lineSpacing(16)
                  .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                  .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                  
                  FirebaseTextField(placeHolder: "@username", text: $viewModel.username)
              }
                VStack(alignment: .leading, spacing: 2) {
                    Text("Mobile No")
                      .font(Font.custom("Roboto", size: 14))
                      .tracking(0.40)
                      .lineSpacing(16)
                      .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                      .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                      
                      FirebaseTextField(placeHolder: "Ex: 0000", text: $viewModel.phoneno)
                  }
                VStack(alignment: .leading, spacing: 2) {
                    Text("Email")
                      .font(Font.custom("Roboto", size: 14))
                      .tracking(0.40)
                      .lineSpacing(16)
                      .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                      .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                      
                      FirebaseTextField(placeHolder: "Ex: 0000", text: $viewModel.email)
                  }
                VStack(alignment: .leading, spacing: 2) {
                  Text("Date Of Birth")
                    .font(Font.custom("Roboto", size: 14))
                    .tracking(0.40)
                    .lineSpacing(16)
                    .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                    .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                    
                    FirebaseTextField(placeHolder: "MM/DD/YYYY", text: $viewModel.dob)
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text("Addresss Line")
                      .font(Font.custom("Roboto", size: 14))
                      .tracking(0.40)
                      .lineSpacing(16)
                      .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                      .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                      
                      FirebaseTextField(placeHolder: "House number and street name", text: $viewModel.addressline)
                  }
                VStack(alignment: .leading, spacing: 2) {
                    Text("City")
                      .font(Font.custom("Roboto", size: 14))
                      .tracking(0.40)
                      .lineSpacing(16)
                      .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                      .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                      
                      FirebaseTextField(placeHolder: "City, Street", text: $viewModel.city)
                  }
                VStack(alignment: .leading, spacing: 2) {
                    Text("Postcode")
                      .font(Font.custom("Roboto", size: 14))
                      .tracking(0.40)
                      .lineSpacing(16)
                      .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                      .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                      
                      FirebaseTextField(placeHolder: "Ex: 0000", text: $viewModel.postcode)
                  }
                VStack(alignment: .leading, spacing: 2) {
                    Text("Country")
                      .font(Font.custom("Roboto", size: 14))
                      .tracking(0.40)
                      .lineSpacing(16)
                      .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                      .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                      
                      FirebaseTextField(placeHolder: "USA", text: $viewModel.country)
                  }
                Button(action: {
                    navigateToAccountVerify1(themeManager: themeManager)
                }) {
                    HStack(spacing: 8) {
                        Text("Continue")
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
                   
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(themeManager.currentTheme.sunBackgroundColor) // Apply background color
        .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color
        .background(Color.white)
        .ignoresSafeArea()

    }
}

#if DEBUG
struct AccountSetUpEmail_Previews: PreviewProvider {
    static var previews: some View {
        AccountSetUpEmail().environmentObject(ThemeManager()) // Provide the theme manager
    }
}
#endif
