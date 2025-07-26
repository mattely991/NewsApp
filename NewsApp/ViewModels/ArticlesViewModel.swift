//
//  ArticlesViewModel.swift
//  NewsApp
//
//  Created by apple on 27/07/2025.
//

import Foundation

class ArticlesViewModel {
    var articles: [Article] = []
    var onDataUpdated: (() -> Void)?
    
    func fetchArticles() {
        NewsAPIService.shared.fetchTopHeadlines { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    self?.articles = articles
                    self?.onDataUpdated?()
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}
