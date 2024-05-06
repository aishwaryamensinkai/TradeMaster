//
//  MainPage.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/3/24.
//

import SwiftUI
import Kingfisher

struct MainPage: View {
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager
    @State private var isSunTheme = true // Track the current theme (true for sun, false for moon)
    @StateObject private var viewModel = CoinsViewModel()

    @StateObject private var log = SignInEmailViewModel()

    @State private var isShowingStockSearchSheet: Bool = false
    var body: some View {
        VStack {
            Spacer().frame(height: 40)

            HStack {
                Spacer()
                Button(action: {
                    self.themeManager.switchTheme(to: lightTheme)
                }) {
                    Image(systemName: "sun.max.fill")
                        .foregroundColor(isSunTheme ? .yellow : .gray)
                        .font(.system(size: 24))
                }
                .padding(16)
                .onTapGesture {
                    self.isSunTheme.toggle()
                }
                
                Button(action: {
                    self.themeManager.switchTheme(to: darkTheme)
                }) {
                    Image(systemName: "moon.fill")
                        .foregroundColor(isSunTheme ? .gray : .yellow)
                        .font(.system(size: 24))
                }
                .padding(16)
                .onTapGesture {
                    self.isSunTheme.toggle()
                }
                
                Spacer()
            }
                Button(action: {
                    Task{
                        do {
                            try log.logOut()
                            navigateToSignIn(themeManager: themeManager)
                        } catch {
                            print("Error signing out: \(error.localizedDescription)")
                        }
                    }
                }) {
                    Text("Sign Out")
                }
            Button(action: {
                navigatecontentview(themeManager: themeManager)
            }) {
                Text("Content View")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(themeManager.currentTheme.sunBackgroundColor) // Apply background color
        .foregroundColor(themeManager.currentTheme.sunTextColor) // Use sun text color
        .background(Color.white)
        .ignoresSafeArea()
        }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage().environmentObject(ThemeManager()) // Provide the theme manager
    }
}
