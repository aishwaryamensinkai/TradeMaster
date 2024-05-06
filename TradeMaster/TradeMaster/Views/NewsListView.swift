//
//  NewsListView.swift

import SwiftUI

struct NewsListView: View {
    
    @ObservedObject var newsManager: NewsDownloadManager
    @State private var selectedArticle: News?
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(newsManager.newsArticle) { article in
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            Text(article.title)
                                .bold()
                                .foregroundColor(.white)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Spacer()
                            
                            AsyncImage(url: URL(string: article.imageUrl)) { image in
                                image.resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 160)
                                    .cornerRadius(10)
                            } placeholder: {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white.opacity(0.2))
                                    .frame(width: 100, height: 160)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedArticle = article
                        }
                        
                        Link("Learn More", destination: URL(string: article.url)!) // Display link as "Learn More"
                                                    .foregroundColor(.white)
                                                    .font(.caption)
                                                    .padding(.top, 4)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white.opacity(0.2))
                            .padding(.horizontal, 50)
                            .frame(height: 1)
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}


