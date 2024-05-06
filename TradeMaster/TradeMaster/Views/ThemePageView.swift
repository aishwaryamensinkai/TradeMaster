//
//  ThemePageView.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 4/4/24.
//

import SwiftUI

struct ThemePageView: View {
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager
    
    @State private var isSunTheme = true // Track the current theme (true for sun, false for moon)
    @State private var isOnboarding2Active = false // State variable to track if Onboarding2 view should be active

    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Spacer().frame(height: 90)
                    Button(action: {
                        // Action when the button is tapped
                        navigateToSignIn(themeManager: themeManager)
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
                
                Image("sun")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 400)
                
                HStack {
                    Spacer()
                    Button(action: {
                        self.themeManager.switchTheme(to: lightTheme)
                    }) {
                        Image(systemName: "sun.max.fill")
                            .foregroundColor(isSunTheme ? .yellow : .gray)
                            .font(.system(size: 24))
                    }
                    .padding(16)
                    .onTapGesture {
                        self.isSunTheme.toggle()
                    }
                    
                    Button(action: {
                        self.themeManager.switchTheme(to: darkTheme)
                    }) {
                        Image(systemName: "moon.fill")
                            .foregroundColor(isSunTheme ? .gray : .yellow)
                            .font(.system(size: 24))
                    }
                    .padding(16)
                    .onTapGesture {
                        self.isSunTheme.toggle()
                    }
                    
                    Spacer()
                }
                
                Spacer().frame(height: 40)
                
                Text("You can immediately \nselect a color theme")
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
            .padding()
            .frame(maxWidth: .infinity)
            .background(themeManager.currentTheme.sunBackgroundColor) // Apply background color
            .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color
        }
        .background(Color.white)
        .ignoresSafeArea()
    }
    
    func navigateToNextPage() {
        // Create an instance of the next view
        let onboardingView = Onboarding1().environmentObject(themeManager)
        
        // Present the next view without NavigationView
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                window.rootViewController = UIHostingController(rootView: onboardingView)
                window.makeKeyAndVisible()
            }
        }
    }

}

#if DEBUG
struct ThemePageView_Previews: PreviewProvider {
    static var previews: some View {
        ThemePageView().environmentObject(ThemeManager()) // Provide the theme manager
    }
}
#endif
