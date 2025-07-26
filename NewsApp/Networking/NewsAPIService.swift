//
//  NewsAPIService.swift
//  NewsApp
//
//  Created by apple on 27/07/2025.
//

import Foundation


class NewsAPIService {
    static let shared = NewsAPIService()
    private let apiKey = "e54b892c9594416da6efd25479e65d7b"
    
    func fetchTopHeadlines(completion: @escaping (Result<[Article], Error>) -> Void) {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else { return }

            do {
                let response = try JSONDecoder().decode(NewsResponse.self, from: data)
                completion(.success(response.articles))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

struct NewsResponse: Codable {
    let articles: [Article]
}
