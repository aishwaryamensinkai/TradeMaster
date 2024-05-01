//
//  TradeMasterApp.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 4/4/24.
//

import SwiftUI
import Firebase
import UIKit

// Ensure that AppDelegate conforms to the UIApplicationDelegate protocol
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

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
