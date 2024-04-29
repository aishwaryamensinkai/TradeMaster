//
//  ThemeManager.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 4/25/24.
//

import SwiftUI

class ThemeManager: ObservableObject {
    @Published var currentTheme: Theme
    
    init() {
        self.currentTheme = lightTheme // Set initial theme to lightTheme
    }
    
    func switchTheme(to theme: Theme) {
        currentTheme = theme
        print("Theme changed to:", currentTheme)
    }
}

