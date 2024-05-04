//
//  SignInEmailViewModel.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/2/24.
//

import Foundation

@MainActor
final class SignInEmailViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var showPassword = false
    
    
    func registerUserWithEmail(themeManager: ThemeManager) {
        guard !email.isEmpty, !password.isEmpty else{
            print("No email or password found.")
            return
        }
        Task{
            do{
                let returnedUserData = try await AuthenticationManager.shared.registerWithEmail(email: email, password: password)
                print(returnedUserData)
                // Inside Button action for successful registration
//                TradeMaster.showAlert(message: "Registration successful.")
                // Clear fields
                email = ""
                password = ""
                showPassword = false
                navigateToWelcome(themeManager: themeManager)
            }
            catch{
                print("Error: \(error)")
                TradeMaster.showAlert(message: "Registration failed.")

            }
        }
    }
    
    func signinUserWithEmail(themeManager: ThemeManager) {
        guard !email.isEmpty, !password.isEmpty else{
            print("No email or password found.")
            return
        }
        Task{
            do{
                let returnedUserData = try await AuthenticationManager.shared.signInWithEmail(email: email, password: password)
                print(returnedUserData)
                navigateToMainPage(themeManager: themeManager)

            }
            catch{
                print("Error: \(error)")
                TradeMaster.showAlert(message: "Login failed.")

            }
        }
    }
    
}
