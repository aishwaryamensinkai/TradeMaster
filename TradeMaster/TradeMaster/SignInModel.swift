//
//  SignInModel.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 4/29/24.
//

import Observation

enum AppAuthError: Error{
    case invalidEmail
    case invalidPasswordLength
}

@Observable
class SignInModel{
    var email = ""
    var password = ""
    var showPassword = false
    
    func validateForm() throws{
        if !email.isValidEmail(){
            throw AppAuthError.invalidEmail
        }
        else if password.count < 8{
            throw AppAuthError.invalidPasswordLength
        }
    }
    
    func signInWithEmail(){
        Task{
            do{
                try validateForm()
                try await AuthService.shared.signInWithEmail(email: email, password: password)
            } catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func registerWithEmail(){
        Task{
            do{
                try validateForm()
                try await AuthService.shared.registerWithEmail(email: email, password: password)
            } catch{
                print(error.localizedDescription)
            }
        }
    }
    
}
