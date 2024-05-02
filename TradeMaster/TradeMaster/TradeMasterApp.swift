//
//  TradeMasterApp.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 4/4/24.
//

import SwiftUI
import Firebase

@main
struct TradeMasterApp: App {
    // Initialize ThemeManager
    let themeManager = ThemeManager()
    
    init(){
        FirebaseApp.configure()
        print("Firebase configured")
    }
    
    var body: some Scene {
        WindowGroup {
            // Pass the themeManager as an environment object to SplashScreenView
            SplashScreenView()
                .environmentObject(themeManager)
        }
    }
}
