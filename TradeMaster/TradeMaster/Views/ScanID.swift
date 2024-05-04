//
//  ScanID.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/3/24.
//

import SwiftUI

struct ScanID: View {
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager
    
    var body: some View {
        VStack {            
            Spacer().frame(height: 60)

              Text("1/2")
                .font(Font.custom("Roboto", size: 18))
                .tracking(0.20)
                .lineSpacing(20)
                .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                
            Text("Please scan front\nof your ID card")
                .font(Font.custom("Roboto", size: 26).weight(.bold))
                .tracking(0.08)
                .multilineTextAlignment(.center) // Align text to the center
                .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration

            Image("CameraFrame")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 400)
            
            Text("ID Verification in progress")
                .font(Font.custom("Roboto", size: 32).weight(.bold))
                .tracking(0.08)
                .multilineTextAlignment(.center) // Align text to the center
                .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
            Text("Hold tight, it won’t take long")
                .font(Font.custom("Roboto", size: 16).weight(.bold))
                .tracking(0.08)
                .multilineTextAlignment(.center) // Align text to the center
                .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
            
            Spacer().frame(height: 40)
            
            Button(action: {
                // Action to perform when the button is tapped (e.g., take a picture)
            }) {
                VStack(spacing: 4) {
                    HStack(spacing: 0) {
                        ZStack() {
                            ZStack() { }
                            .frame(width: 19.50, height: 17.25)
                            .offset(x: 0, y: -0.38)
                            Image(systemName: "qrcode.viewfinder")
                                .foregroundColor(.white) // Customize color if needed
                                .font(.system(size: 20)) // Adjust size if needed
                        }
                        .frame(width: 24, height: 24)
                    }
                    .padding(12)
                    .background(Color(red: 0.07, green: 0.32, blue: 0.45))
                    .cornerRadius(4)
                    Text("Click here")
                        .font(Font.custom("Roboto", size: 14).weight(.medium))
                        .tracking(0.10)
                        .lineSpacing(20)
                        .background(themeManager.currentTheme.sunBackgroundColor) // Apply background color
                        .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color

                }
                .frame(width: 80, height: 72)
            }

            
            Spacer().frame(height: 40)

            
            Button(action: {
                // Action when the button is tapped
                navigateToAccountVerify5(themeManager: themeManager)
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
struct ScanID_Previews: PreviewProvider {
    static var previews: some View {
        ScanID().environmentObject(ThemeManager()) // Provide the theme manager
    }
}
#endif
