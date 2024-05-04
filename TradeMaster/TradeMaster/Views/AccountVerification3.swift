//
//  AccountVerification3.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/3/24.
//

import SwiftUI

struct AccountVerification3: View {
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager
    
    var body: some View {
        VStack {
            Spacer().frame(height: 40)
            
            Image("scanId")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 400)
            
            Text("Scan ID document to\nverify your identity")
                .font(Font.custom("Roboto", size: 36).weight(.bold))
                .tracking(0.08)
                .multilineTextAlignment(.center) // Align text to the center
                .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
            
            Spacer().frame(height: 20)

        
            Text("Confirm your identity with just a few taps on\nyour phone")
                .font(Font.custom("Roboto", size: 16).weight(.bold))
                .tracking(0.08)
                .multilineTextAlignment(.center) // Align text to the center
                .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
            
        
            
            Spacer().frame(height: 100)

            
            Button(action: {
                // Action when the button is tapped
                navigateToScanID(themeManager: themeManager)
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
}


#if DEBUG
struct AccountVerification3_Previews: PreviewProvider {
    static var previews: some View {
        AccountVerification3().environmentObject(ThemeManager()) // Provide the theme manager
    }
}
#endif
