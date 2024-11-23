//
//  ArticleResp.swift
//  NewsApp8ass
//
//  Created by ntvlbl on 23.11.2024.
//

import Foundation
struct ArticlesResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
