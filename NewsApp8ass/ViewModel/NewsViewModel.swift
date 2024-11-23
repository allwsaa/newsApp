//
//  NewsViewModel.swift
//  NewsApp8ass
//
//  Created by ntvlbl on 23.11.2024.
//

import Foundation

class NewsViewModel {
    private(set) var articles: [Article] = []
    var onDataUpdated: (() -> Void)?
    var onError: ((String) -> Void)?

    func fetchArticles(for url: String) {
        NetworkService.shared.fetchArticles(from: url) { [weak self] result in
            switch result {
            case .success(let newArticles):
                self?.articles = newArticles
                self?.onDataUpdated?()
            case .failure(let error):
                self?.onError?(error.localizedDescription)
            }
        }
    }
}
