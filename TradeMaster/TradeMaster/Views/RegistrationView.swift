//
//  RegistrationView.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 4/25/24.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager
        
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                Image("RegistrationScreen")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350, height: 400)
                
                Spacer().frame(height: 180)
                
                Text("Create your account")
                    .font(Font.custom("Roboto", size: 36).weight(.bold))
                    .tracking(0.08)
                    .multilineTextAlignment(.center) // Align text to the center
                    .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                    .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                
                
                Spacer().frame(height: 40)
                
                Button(action: {
                    navigateToSignIn()
                }) {
                    Text("Sign In")
                        .font(Font.custom("Roboto", size: 28).weight(.black))
                        .tracking(0.10)
                        .lineSpacing(24)
                        .foregroundColor(Color(red: 0.07, green: 0.32, blue: 0.45)) // Text color
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                }
                .frame(width: 358, height: 40)
                .background(Color.clear) // Set background color to clear
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color(red: 0.07, green: 0.32, blue: 0.45), lineWidth: 2) // Border color
                )
                
                Spacer().frame(height: 20)
                
                Button(action: {
                    navigateToSignUp()
                }) {
                    Text("Sign Up")
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
            
            Spacer().frame(height: 20)
        }
        .ignoresSafeArea()

    }
    
    func navigateToSignUp() {
        // Create an instance of the next view
        let view = SignUp().environmentObject(themeManager)
        
        // Present the next view without NavigationView
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                window.rootViewController = UIHostingController(rootView: view)
                window.makeKeyAndVisible()
            }
        }
    }
    
    func navigateToSignIn() {
        // Create an instance of the next view
        let view = SignIn().environmentObject(themeManager)
        // Present the next view without NavigationView
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                window.rootViewController = UIHostingController(rootView: view)
                window.makeKeyAndVisible()
            }
        }
    }
}


#if DEBUG
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView().environmentObject(ThemeManager()) // Provide the theme manager
    }
}
#endif
