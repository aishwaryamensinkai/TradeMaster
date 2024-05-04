//
//  GoogleSignIn.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/3/24.
//

import Foundation
import GoogleSignIn
import FirebaseAuth

@MainActor
final class GoogleSignIn: ObservableObject {
    func signInGoogle(themeManager: ThemeManager) async throws {
        guard let topVC = Utils.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidsignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken: String = gidsignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        
        let accessToken: String = gidsignInResult.user.accessToken.tokenString
        let tokens = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken)
        
        // Check if the user has previously signed in
        let isFirstTimeUser = !UserDefaults.standard.bool(forKey: "userLoggedIn")
        
        if isFirstTimeUser {
            navigateToWelcome(themeManager: themeManager)

            // Set the flag indicating that the user has logged in
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
        } else {
            // Perform actions specific to old users
            navigateToMainPage(themeManager: themeManager)

        }
        
        try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)
    }
}
