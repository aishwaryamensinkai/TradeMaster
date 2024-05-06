//
//  SettingsView.swift
//  TradeMaster
//
//  Created by Aishwarya Girish Mensinkai on 5/2/24.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var themeManager: ThemeManager // Inject the theme manager
    @StateObject private var log = SignInEmailViewModel()
    @ObservedObject var newsManager = NewsDownloadManager()

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                // background
                Color.themes.background
                    .ignoresSafeArea()
                VStack(alignment: .leading) {
                    Button(action: {
                        navigateToProfile(themeManager: themeManager)
                    }) {
                        Text("Profile")
                            .font(.system(size: 24))
                    }
                    Button(action: {
                        navigateToNews(newsManager: newsManager)
                    }) {
                        Text("News")
                            .font(.system(size: 24))
                    }
                    Button(action: {
                        navigateToCardlListView(themeManager: themeManager)
                    }) {
                        Text("Cards")
                            .font(.system(size: 24))
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
                            .font(.system(size: 24)) // Increase font size
                    }
                }
            }
            .accentColor(.blue)
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(ThemeManager()) // Provide the theme manager
    }
}
