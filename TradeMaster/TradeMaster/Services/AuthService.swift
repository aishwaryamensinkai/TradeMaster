//
//  AuthService.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 4/30/24.
//

import Foundation
import FirebaseAuth

@Observable
final class AuthService{
    private let auth = Auth.auth()
    static let shared = AuthService()
    var currentUser: FirebaseAuth.User?
    
    private init(){
        self.currentUser = auth.currentUser
    }
    
    func registerWithEmail(email:String, password:String) async throws{
        let result = try await auth.createUser(withEmail: email, password: password)
        currentUser = result.user
    }
    
    func signInWithEmail(email:String, password:String) async throws{
       let result = try await auth.signIn(withEmail: email, password: password)
        currentUser = result.user
    }
    
    func signOut() throws{
        try auth.signOut()
        currentUser = nil
    }
}
