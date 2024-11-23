//
//  Article.swift
//  NewsApp8ass
//
//  Created by ntvlbl on 23.11.2024.
//

import Foundation

struct Article: Codable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct Source: Codable {
    let id: String?
    let name: String?
}
