//
//  AddingCard.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/3/24.
//

import SwiftUI

struct AddingCard: View {
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager
    
    var body: some View {
        ScrollView{
            
            VStack {
                Spacer().frame(height: 130)
                
                Image("Addingcard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 400)
                
                
                Spacer().frame(height: 40)
                
                Text("Let’s add your card")
                    .font(Font.custom("Roboto", size: 36).weight(.bold))
                    .tracking(0.08)
                    .multilineTextAlignment(.center) // Align text to the center
                    .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                    .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                
                Spacer().frame(height: 20)
                
                Text("Experience the power of financial organization\nwith our platform")
                    .font(Font.custom("Roboto", size: 16).weight(.medium))
                    .tracking(0.08)
                    .multilineTextAlignment(.center) // Align text to the center
                    .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                    .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                
                Spacer().frame(height: 60)
                
                Button(action: {
                    // Action when the button is tapped
                    navigateToCardInfo(themeManager: themeManager)
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 20)) // Adjust size if needed
                        
                        Text("Add your card")
                            .font(Font.custom("Roboto", size: 28).weight(.black))
                            .tracking(0.10)
                            .lineSpacing(24)
                            .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.96))
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 16)) // Adjust leading padding
                    }
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
struct AddingCard_Previews: PreviewProvider {
    static var previews: some View {
        AddingCard().environmentObject(ThemeManager()) // Provide the theme manager
    }
}
#endif
