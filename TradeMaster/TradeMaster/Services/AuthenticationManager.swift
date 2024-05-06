//  AuthenticationManager.swift
//  TradeMaster
//  Created by Aishwarya Girish Mensinkai on 4/30/24.

import Foundation
import FirebaseAuth

final class AuthenticationManager{
    private let auth = Auth.auth()
    static let shared = AuthenticationManager()
    
    private init(){
    }

    func getAuthenticatedUser() throws -> AuthDataResultModel{
        guard let user = auth.currentUser else{
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user: user)
    }
    
    func signOut() throws{
        try auth.signOut()
    }
 
}

// MARK: SIGN IN EMAIL
extension AuthenticationManager{
    @discardableResult
    func registerWithEmail(email:String, password:String) async throws -> AuthDataResultModel{
        let authDataResult = try await auth.createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    @discardableResult
    func signInWithEmail(email:String, password:String) async throws -> AuthDataResultModel{
        let authDataResult = try await auth.signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
}

// MARK: SIGN IN SSD
extension AuthenticationManager{
    @discardableResult
    func signInWithGoogle(tokens: GoogleSignInResultModel) async throws -> AuthDataResultModel{
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken  , accessToken: tokens.accessToken)

        return try await signInWithCredential(credential: credential)
    }
    
    func signInWithCredential(credential: AuthCredential) async throws -> AuthDataResultModel{
        let authDataResult = try await auth.signIn(with: credential)
        return AuthDataResultModel(user: authDataResult.user)
    }
}
