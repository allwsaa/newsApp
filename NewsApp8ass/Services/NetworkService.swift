//
//  NetworkService.swift
//  NewsApp8ass
//
//  Created by ntvlbl on 23.11.2024.
//

import Foundation
import Alamofire

class NetworkService {
    static let shared = NetworkService()

    private init() {}

    func fetchArticles(from url: String, completion: @escaping (Result<[Article], Error>) -> Void) {
        let parameters: Parameters = [
            "apiKey": NewsApi.apiKey
        ]

        AF.request(url, method: .get, parameters: parameters)
            .responseDecodable(of: ArticlesResponse.self) { response in
                switch response.result {
                case .success(let articlesResponse):
                    completion(.success(articlesResponse.articles))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
