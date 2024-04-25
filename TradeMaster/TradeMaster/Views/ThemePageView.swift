//
//  ThemePageView.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 4/4/24.
//

import SwiftUI

struct ThemePageView: View {
    @State private var isSunTheme = true // Track the current theme (true for sun, false for moon)
    var body: some View {
        VStack {
            // Add Spacer to create more space at the top
            Spacer()
                .frame(height: 40) // Adjust the height as needed
            
            HStack {
                Spacer() // Add Spacer to push the button to the right
                Spacer()
                Spacer()
                Button(action: {
                    // Action when the button is tapped
                }) {
                    Text("Skip")
                        .font(Font.custom("Roboto", size: 16).weight(.medium))
                        .tracking(0.15)
                        .lineSpacing(20)
                        .foregroundColor(Color(red: 0.07, green: 0.32, blue: 0.45))
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 16))
            }
            .padding(.top, 16) // Add some additional top padding to the HStack
            
            // Add Spacer to create space between the button and the image
            Spacer()
                .frame(height: 40) // Adjust the height as needed
            
            Image("sun")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 400)//Adjust the size as needed
            
            // Toggle between sun and moon themes when the icon is tapped
            HStack {
                            Spacer() // Add Spacer to push the icons to the sides
                            Spacer()
                            Button(action: {
                                self.isSunTheme.toggle()
                            }) {
                                Image(systemName: "sun.max.fill")
                                    .foregroundColor(isSunTheme ? .yellow : .gray)
                                    .font(.system(size: 24))
                            }
                            .padding(16)
                            
                            Button(action: {
                                self.isSunTheme.toggle()
                            }) {
                                Image(systemName: "moon.fill")
                                    .foregroundColor(isSunTheme ? .gray : .yellow)
                                    .font(.system(size: 24))
                            }
                            .padding(16)
                            Spacer()
                            Spacer()
                        }
            
            Spacer().frame(height: 40)
            
            Text("You can immediately \nselect a color theme")
              .font(Font.custom("Roboto", size: 36).weight(.bold))
              .tracking(0.08)
              .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
            
            Spacer().frame(height: 40)
            
            Button(action: {
                // Action when the button is tapped
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

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .ignoresSafeArea()
    }
}

#Preview {
    ThemePageView()
}
