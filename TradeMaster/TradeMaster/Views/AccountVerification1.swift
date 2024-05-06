//
//  AccountVerification1.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/3/24.
//

import SwiftUI

struct AccountVerification1: View {
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager
    
    var body: some View {
        ScrollView{
            
            VStack {
                Spacer().frame(height:  50)
                Spacer().frame(height: 10)
                
                Image("AccountVerification")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 400)
                
                Text("Setting up\nyour account")
                    .font(Font.custom("Roboto", size: 36).weight(.bold))
                    .tracking(0.08)
                    .multilineTextAlignment(.center) // Align text to the center
                    .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                    .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                Text("We are analyzing your data to verify")
                    .font(Font.custom("Roboto", size: 16).weight(.bold))
                    .tracking(0.08)
                    .multilineTextAlignment(.center) // Align text to the center
                    .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                    .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                
                Spacer().frame(height: 40)
                
                VStack(alignment: .leading, spacing: 20) {
                    HStack(spacing: 90) {
                        HStack(spacing: 8) {
                            ZStack() {
                                Ellipse()
                                    .foregroundColor(Color(red: 0.07, green: 0.32, blue: 0.45).opacity(0.15))
                                    .frame(width: 32, height: 32)
                                Text("1")
                                    .font(Font.custom("Roboto", size: 14).weight(.medium))
                                    .tracking(0.10)
                                    .lineSpacing(20)
                                    .foregroundColor(Color(red: 0.07, green: 0.32, blue: 0.45))
                                    .offset(x: 0, y: 0)
                            }
                            .frame(width: 32, height: 32)
                            Text("Phone verified")
                                .font(Font.custom("Roboto", size: 16))
                                .tracking(0.20)
                                .lineSpacing(20)
                                .background(themeManager.currentTheme.sunBackgroundColor) // Apply background color
                                .foregroundColor(themeManager.currentTheme.sunTextColor)
                        }
                        .frame(maxWidth: .infinity, minHeight: 32, maxHeight: 32)
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green) // Customize color if needed
                            .font(.system(size: 24)) // Adjust size if needed
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0))
                    .frame(maxWidth: .infinity)
                    
                    HStack(spacing: 90) {
                        HStack(spacing: 8) {
                            ZStack() {
                                Ellipse()
                                    .foregroundColor(Color(red: 0.07, green: 0.32, blue: 0.45).opacity(0.15))
                                    .frame(width: 32, height: 32)
                                Text("2")
                                    .font(Font.custom("Roboto", size: 14).weight(.medium))
                                    .tracking(0.10)
                                    .lineSpacing(20)
                                    .foregroundColor(Color(red: 0.07, green: 0.32, blue: 0.45))
                                    .offset(x: 0, y: 0)
                            }
                            .frame(width: 32, height: 32)
                            Text("Verifying photo")
                                .font(Font.custom("Roboto", size: 16))
                                .tracking(0.20)
                                .lineSpacing(20)
                                .background(themeManager.currentTheme.sunBackgroundColor) // Apply background color
                                .foregroundColor(themeManager.currentTheme.sunTextColor)
                        }
                        .frame(maxWidth: .infinity, minHeight: 32, maxHeight: 32)
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red) // Customize color if needed
                            .font(.system(size: 24)) // Adjust size if needed
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0))
                    .frame(maxWidth: .infinity)
                    
                    HStack(spacing: 10) {
                        HStack(spacing: 8) {
                            ZStack() {
                                Ellipse()
                                    .foregroundColor(Color(red: 0.07, green: 0.32, blue: 0.45).opacity(0.15))
                                    .frame(width: 32, height: 32)
                                Text("3")
                                    .font(Font.custom("Roboto", size: 14).weight(.medium))
                                    .tracking(0.10)
                                    .lineSpacing(20)
                                    .foregroundColor(Color(red: 0.07, green: 0.32, blue: 0.45))
                                    .offset(x: 0, y: 0)
                            }
                            .frame(width: 32, height: 32)
                            Text("Checking up document ID")
                                .font(Font.custom("Roboto", size: 16))
                                .tracking(0.20)
                                .lineSpacing(20)
                                .background(themeManager.currentTheme.sunBackgroundColor) // Apply background color
                                .foregroundColor(themeManager.currentTheme.sunTextColor)
                        }
                        .frame(maxWidth: .infinity, minHeight: 32, maxHeight: 32)
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red) // Customize color if needed
                            .font(.system(size: 24)) // Adjust size if needed
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 12, trailing: 0))
                    .frame(maxWidth: .infinity)
                }
                .frame(width: 310, height: 164)
                
                Button(action: {
                    // Action when the button is tapped
                    navigateToAccountVerify2(themeManager: themeManager)
                }) {
                    Text("Next")
                        .font(Font.custom("Roboto", size: 28).weight(.black))
                        .tracking(0.10)
                        .lineSpacing(24)
                        .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.96))
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    
                }
                .frame(width: 358, height: 40)
                .background(Color(red: 0.07, green: 0.32, blue: 0.45))
                .cornerRadius(4)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(themeManager.currentTheme.sunBackgroundColor) // Apply background color
            .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color
            .background(Color.white)
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
}


#if DEBUG
struct AccountVerification1_Previews: PreviewProvider {
    static var previews: some View {
        AccountVerification1().environmentObject(ThemeManager()) // Provide the theme manager
    }
}
#endif
