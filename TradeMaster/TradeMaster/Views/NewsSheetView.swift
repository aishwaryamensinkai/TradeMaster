//
//  NewsSheetView.swift

import SwiftUI

struct NewsSheetView: View {
    
    @ObservedObject var newsManager: NewsDownloadManager
    
    init(newsManager: NewsDownloadManager) {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        self.newsManager = newsManager
    }
    
    var body: some View {
            ZStack {
                Rectangle().fill(Color.black.opacity(0.8))
                
                VStack(alignment: .leading) {
                    Button(action: {
                            // Action for going back
                            let themeManager = ThemeManager() // Create an instance of ThemeManager
                            navigateToMainPage(themeManager: themeManager)
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                            .font(.title)
                    }
                    NewsHeaderView()
                    
                    Spacer()
                    
                    NewsListView(newsManager: newsManager)
                    
                }.padding()
            }
    }
}
