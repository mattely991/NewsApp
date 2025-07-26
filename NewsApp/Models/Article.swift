//
//  Artical.swift
//  NewsApp
//
//  Created by apple on 27/07/2025.
//

struct Article: Codable {
    let title: String
    let author: String?
    let description: String?
    let urlToImage: String?
    let source: Source
}
struct Source: Codable {
    let name: String
}
