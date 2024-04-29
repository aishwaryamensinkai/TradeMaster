//
//  TradeMasterApp.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 4/4/24.
//

import SwiftUI
import SwiftData

@main
struct TradeMasterApp: App {
    let themeManager = ThemeManager() // Initialize ThemeManager
    var body: some Scene {
        WindowGroup {
            SplashScreenView().environmentObject(themeManager) // Provide the theme manager
        }    }
}
