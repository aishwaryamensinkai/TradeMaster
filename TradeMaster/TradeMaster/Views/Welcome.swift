//
//  Welcome.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/1/24.
//

import SwiftUI

struct Welcome: View {
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager

    var body: some View {
        VStack {
            Spacer().frame(height: 100)
            
            Image("WelcomeScreen")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 400)

            Spacer().frame(height: 60)
            
            Text("Your account has been\nsuccessfully created!")
                .font(Font.custom("Roboto", size: 36).weight(.bold))
                .tracking(0.08)
                .multilineTextAlignment(.center) // Align text to the center
                .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration


            Spacer().frame(height: 40)
            
            Button(action: {
                // Action when the button is tapped
                navigateToNextPage()
            }) {
                Text("Get Started")
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
            let onboarding2View = Onboarding2().environmentObject(themeManager)
            
            // Present the next view using NavigationView
            let nextView = NavigationView {
                onboarding2View
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
struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome().environmentObject(ThemeManager()) // Provide the theme manager
    }
}
#endif
