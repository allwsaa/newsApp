//
//  NewsApi.swift
//  NewsApp8ass
//
//  Created by ntvlbl on 23.11.2024.
//

import Foundation

struct NewsApi {
    static let apiKey = "a4207b2eee8f41709484141a923bcc49"
    static let baseUrl = "https://newsapi.org/v2/"
    static let businessNewsURL = "\(baseUrl)top-headlines?country=us&category=business&apiKey=\(apiKey)"
    static let appleNewsURL = "\(baseUrl)everything?q=apple&from=2024-11-22&to=2024-11-22&sortBy=popularity&apiKey=\(apiKey)"
}
