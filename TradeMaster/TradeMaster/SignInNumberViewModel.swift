//
//  SignInNumberViewModel.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/3/24.
//

import Foundation

@MainActor
final class SignInNumberViewModel: ObservableObject{
    @Published var number = ""
    @Published var password = ""
    @Published var showPassword = false
    
    
    func registerUserWithNumber(themeManager: ThemeManager) {
//        guard !number.isEmpty, !password.isEmpty else{
//            print("No Number or password found.")
//            return
//        }
        Task{
            do{
//                let returnedUserData = try await AuthenticationManager.shared.registerWithEmail(email: email, password: password)
//                print(returnedUserData)
                // Clear fields
                number = ""
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

    func signinUserWithNumber(themeManager: ThemeManager) {
//        guard !email.isEmpty, !password.isEmpty else{
//            print("No email or password found.")
//            return
//        }
        Task{
            do{
//                let returnedUserData = try await AuthenticationManager.shared.signInWithEmail(email: email, password: password)
//                print(returnedUserData)
                navigateToMainPage(themeManager: themeManager)
            }
            catch{
                print("Error: \(error)")
                TradeMaster.showAlert(message: "Login failed.")

            }
        }
    }

}
