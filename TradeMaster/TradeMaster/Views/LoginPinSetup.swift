//
//  LoginPinSetup.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/3/24.
//

import SwiftUI

struct LoginPinSetup: View {
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager
    @State private var passcode: String = ""
    @StateObject private var viewModel = UserDetailsModel()

    var body: some View {
        ScrollView{
            
            VStack {
                Spacer().frame(height:  100)
                Button(action: {
                    navigateToWelcome(themeManager: themeManager)
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
                
                Spacer().frame(height: 50)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Create passcode")
                        .font(Font.custom("Roboto", size: 26).weight(.bold))
                        .padding(.top, 16) // Adjusted top padding
                        .background(themeManager.currentTheme.sunBackgroundColor) // Apply background color
                        .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color
                    Text("This info needs to be accurate with your ID\n document.")
                        .font(Font.custom("Roboto", size: 16))
                        .padding(.top, 8) // Adjusted top padding
                        .background(themeManager.currentTheme.sunBackgroundColor) // Apply background color
                        .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color
                }
                .padding(.horizontal, 16) // Adjusted horizontal padding
                
                TextField("", text: $passcode)
                    .keyboardType(.numberPad)
                    .font(Font.custom("Roboto", size: 16))
                    .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
                    .cornerRadius(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(red: 0.80, green: 0.84, blue: 0.91), lineWidth: 0.50)
                    )
                    .onChange(of: passcode) { newValue in
                        // Ensure passcode is 4 digits long
                        if newValue.count > 4 {
                            passcode = String(newValue.prefix(4))
                        }
                    }
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .frame(width: 100, height: 40) // Fixed width to accommodate 4 digits
                    .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                    .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                
                Spacer().frame(height: 30)
                
                Button(action: {
                    viewModel.storePasscodeInFirestore(passcode: passcode,themeManager: themeManager)
                }) {
                    Text("Save")
                        .font(Font.custom("Roboto", size: 16).weight(.medium))
                        .tracking(0.15)
                        .lineSpacing(20)
                        .foregroundColor(.white)
                }
                .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                .frame(minWidth: 100, idealWidth: 200, minHeight: 36, maxHeight: 36) // Adjusted minWidth and idealWidth
                .background(Color(red: 0.07, green: 0.32, blue: 0.45))
                .cornerRadius(2)
                .overlay(
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(Color(red: 0.07, green: 0.32, blue: 0.45), lineWidth: 0.50)
                )
                Spacer().frame(height: 450)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(themeManager.currentTheme.sunBackgroundColor) // Apply background color
            .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color
            .background(Color.white)
            .edgesIgnoringSafeArea(.all) // Ignoring safe area insets
        }
        .ignoresSafeArea()
    }
}

#if DEBUG
struct LoginPinSetup_Previews: PreviewProvider {
    static var previews: some View {
        LoginPinSetup().environmentObject(ThemeManager()) // Provide the theme manager
    }
}
#endif
