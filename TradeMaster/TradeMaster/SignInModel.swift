//
//  SignInModel.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 4/29/24.
//

import Observation

@Observable
class SignInModel{
    var email = ""
    var password = ""
    var showPassword = false
    
    func signInWithEmail(){
        Task{
            do{
                try await AuthService.shared.registerWithEmail(email: email, password: password)
            } catch{
                print(error.localizedDescription)
            }
        }
    }
}
