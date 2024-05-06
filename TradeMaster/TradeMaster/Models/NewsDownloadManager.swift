//
//  NewsDownloadManager.swift

import Foundation

final class NewsDownloadManager: ObservableObject {
    @Published var newsArticle = [News]()

    private let newsUrlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=\(NewsAPI.key)"
    
    init() {
        download();
    }
    
    func download() {
        NetworkManager<NewsResponse>().fetch(from: URL(string: newsUrlString)!) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let response):
                DispatchQueue.main.async {
                    self.newsArticle = response.articles
                }
            }
        }
    }
}
