//
//  SignIn.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 4/27/24.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift

struct SignIn: View {
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager
    @StateObject private var viewModel = SignInEmailViewModel()
    var message : String = ""
    @State private var showAlert = false // State variable to control the presentation of the alert
    @State private var alertMessage = "" // State variable to hold the message for the alert
    @StateObject private var googleModel = GoogleSignIn()

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Spacer().frame(height: 100)
                VStack(alignment: .leading, spacing: 50) {
                    Button(action: {
                        navigateBack(themeManager: themeManager)
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
                    
                    HStack(spacing: 0) {
                        Button(action: {
                            // Action for Sign In button
                            navigateToSignIn(themeManager: themeManager)
                        }) {
                            Text("Sign In")
                                .font(Font.custom("Roboto", size: 16).weight(.medium))
                                .tracking(0.15)
                                .lineSpacing(20)
                                .foregroundColor(.white)
                        }
                        .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                        .frame(minWidth: 150, idealWidth: 200, maxWidth: .infinity, minHeight: 36, maxHeight: 36)
                        .background(Color(red: 0.07, green: 0.32, blue: 0.45))
                        .cornerRadius(2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(Color(red: 0.07, green: 0.32, blue: 0.45), lineWidth: 0.50)
                        )
                        
                        Button(action: {
                            // Action for Sign Up button
                            navigateToSignUp(themeManager: themeManager)
                        }) {
                            Text("Sign Up")
                                .font(Font.custom("Roboto", size: 16).weight(.medium))
                                .tracking(0.15)
                                .lineSpacing(20)
                                .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                        }
                        .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
                        .frame(minWidth: 150, idealWidth: 200, maxWidth: .infinity, minHeight: 36, maxHeight: 36)
                        .background(Color(red: 0.80, green: 0.84, blue: 0.91))
                        .cornerRadius(2)
                        .overlay(
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(Color(red: 0.80, green: 0.84, blue: 0.91), lineWidth: 0.50)
                        )
                    }
                    
                    Text("Sign In")
                        .font(Font.custom("Roboto", size: 24).weight(.medium))
                        .lineSpacing(32)
                        .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                        .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(alignment: .top, spacing: 135) {
                            Text("Email")
                                .font(Font.custom("Roboto", size: 12))
                                .tracking(0.40)
                                .lineSpacing(16)
                                .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                                .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                        }
                        FirebaseTextField(placeHolder: "Enter your email", text: $viewModel.email)
                        
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Password")
                            .font(Font.custom("Roboto", size: 14))
                            .tracking(0.40)
                            .lineSpacing(16)
                            .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color for demonstration
                            .background(themeManager.currentTheme.sunBackgroundColor) // Use sun background color for demonstration
                        
                        //password
                        FirebaseSecureField(placeHolder: "Enter your password", text: $viewModel.password, showPassword: $viewModel.showPassword)
                        
                        Spacer()
                        Button(action: {
                            // Check if email is valid
                            guard isValidEmail(viewModel.email) else {
                                // Show an alert if the email is invalid
                                alertMessage = "Please enter a valid email address."
                                showAlert = true
                                return
                            }
                            
                            // Call resetPassword function with email
                            viewModel.resetPassword(email: viewModel.email) { message in
                                // Show an alert with the reset password message
                                alertMessage = message
                                showAlert = true
                            }
                        }) {
                            Text("Forgot Password?")
                                .font(Font.custom("Roboto", size: 12))
                                .tracking(0.40)
                                .lineSpacing(16)
                                .foregroundColor(Color(red: 0.07, green: 0.32, blue: 0.45))
                        }
                        .buttonStyle(PlainButtonStyle()) // Use PlainButtonStyle to remove default button styling
                        
                    }
                    
                    Button(action: {
                        // Check if email is valid and password length is at least 6 characters
                        guard isValidEmail(viewModel.email) else {
                            TradeMaster.showAlert(message: "Please enter a valid email address.")
                            return
                        }
                        
                        guard viewModel.password.count >= 6 else {
                            TradeMaster.showAlert(message: "Password must be at least 6 characters long.")
                            return
                        }
                        // Check if email or password is empty
                        guard !viewModel.email.isEmpty && !viewModel.password.isEmpty else {
                            TradeMaster.showAlert(message: "Please provide both email and password to sign in.")
                            return
                        }
                        
                        // Login the user if email and password are provided
                        viewModel.signinUserWithEmail(themeManager: themeManager)
                    }) {
                        HStack(spacing: 8) {
                            Text("Sign In")
                                .font(Font.custom("Roboto", size: 20).weight(.medium))
                                .tracking(0.10)
                                .lineSpacing(24)
                                .foregroundColor(Color(red: 0.95, green: 0.95, blue: 0.96))
                        }
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    }
                    .frame(width: 358, height: 40)
                    .background(Color(red: 0.07, green: 0.32, blue: 0.45))
                    .cornerRadius(4)
                    
                    
                    HStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 8) {
                            RoundedRectangle(cornerRadius: 2)
                                .fill(Color(red: 0.80, green: 0.84, blue: 0.91))
                                .frame(width: 155.50, height: 2)
                        }
                        .padding(EdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0))
                        .frame(maxWidth: .infinity)
                        Text("or")
                            .font(Font.custom("Roboto", size: 16))
                            .tracking(0.20)
                            .lineSpacing(20)
                            .foregroundColor(Color(red: 0.83, green: 0.83, blue: 0.83))
                        VStack(alignment: .leading, spacing: 8) {
                            RoundedRectangle(cornerRadius: 2)
                                .fill(Color(red: 0.80, green: 0.84, blue: 0.91))
                                .frame(width: 155.50, height: 2)
                        }
                        .padding(EdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0))
                        .frame(maxWidth: .infinity)
                    }
                    .frame(width: 358, height: 20)
                    
                    Button(action: {
                        // Action to perform when the button is tapped
                        Task{
                            do{
                                try await googleModel.signInGoogle(themeManager: themeManager)
                                //                            navigateToWelcome(themeManager: themeManager)
                            } catch{
                                print(error)
                            }
                        }
                    }) {
                        HStack(spacing: 8) {
                            // Custom Google icon
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color(red: 0.95, green: 0.95, blue: 0.96))
                                .frame(width: 24, height: 24)
                                .overlay(
                                    Text("G")
                                        .font(Font.system(size: 16).weight(.bold))
                                        .foregroundColor(.blue)
                                )
                            
                            Text("Sign in with Google")
                                .font(Font.custom("Roboto", size: 16).weight(.medium))
                                .tracking(0.15)
                                .lineSpacing(20)
                                .foregroundColor(Color(red: 0.07, green: 0.07, blue: 0.07))
                        }
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 24))
                    }
                    .frame(width: 358, height: 40)
                    .background(Color(red: 0.96, green: 0.97, blue: 0.99))
                    .cornerRadius(4)
                }
                .frame(width: 358, height: 750)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(themeManager.currentTheme.sunBackgroundColor) // Apply background color
            .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color
            .background(Color.white)
            .ignoresSafeArea()
            .edgesIgnoringSafeArea(.all)

            Spacer().frame(height: 20)
        }
        .ignoresSafeArea()

    }
}

#if DEBUG
struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn().environmentObject(ThemeManager()) // Provide the theme manager
    }
}
#endif
