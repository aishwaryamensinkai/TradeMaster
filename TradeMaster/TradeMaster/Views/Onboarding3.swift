//
//  Onboarding3.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 4/25/24.
//

import SwiftUI

struct Onboarding3: View {
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager
    
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    // Action when the button is tapped
                }) {
                    Text("Skip")
                        .font(Font.custom("Roboto", size: 20).weight(.medium))
                        .tracking(0.15)
                        .lineSpacing(20)
                        .foregroundColor(Color(red: 0.07, green: 0.32, blue: 0.45))
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 16))
            }
            .padding(.top, 16)
            
            Spacer().frame(height: 40)
            
            Image("Invest")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 400)
            
            HStack(alignment: .top, spacing: 12) {
                ZStack() {
                  Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 48, height: 8)
                    .background(Color(red: 0.07, green: 0.32, blue: 0.45).opacity(0.15))
                    .cornerRadius(4)
                    .offset(x: 0, y: 0)
                }
                .frame(width: 48, height: 8)
                ZStack() {
                  Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 48, height: 8)
                    .background(Color(red: 0.07, green: 0.32, blue: 0.45).opacity(0.15))
                    .cornerRadius(4)
                    .offset(x: 0, y: 0)
                }
                .frame(width: 48, height: 8)
                ZStack() {
                  Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 24, height: 8)
                    .background(Color(red: 0.07, green: 0.32, blue: 0.45))
                    .cornerRadius(4)
                    .offset(x: 0, y: 0)
                }
                .frame(width: 24, height: 8)
              }
              .padding(12)
              .frame(width: 168)

            Spacer().frame(height: 40)
            
            Text("Invest and Earn\nfrom anywhere\nin the world")
                .font(Font.custom("Roboto", size: 36).weight(.bold))
                .tracking(0.08)
                .multilineTextAlignment(.center) // Align text to the center
                .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration


            Spacer().frame(height: 40)
            
            Button(action: {
                navigateToNextPage()
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
    
    func navigateToNextPage() {
            // Create an instance of the next view
            let Registration = RegistrationView().environmentObject(themeManager)
            
            // Present the next view using NavigationView
            let nextView = NavigationView {
                Registration
            }
            
            // Get the relevant window scene
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                    if let window = windowScene.windows.first {
                        // Present the navigation view
                        window.rootViewController = UIHostingController(rootView: nextView)
                        window.makeKeyAndVisible()
                    }
                }
        }
}


#if DEBUG
struct Onboarding3_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding3().environmentObject(ThemeManager()) // Provide the theme manager
    }
}
#endif
