//
//  NewsViewController.swift
//  NewsApp8ass
//
//  Created by ntvlbl on 23.11.2024.
//

import UIKit
import SnapKit

class NewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let tableView = UITableView()
    private let viewModel = NewsViewModel()
    private let newsType: NewsType

    init(newsType: NewsType) {
        self.newsType = newsType
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        fetchArticles()
    }

    private func setupUI() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 94/255, green: 23/255, blue: 41/255, alpha: 1).cgColor,
            UIColor.darkGray.cgColor
        ]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)

        title = newsType == .business ? "Business News" : "Apple News"
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView.register(NewCell.self, forCellReuseIdentifier: NewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear 
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func bindViewModel() {
        viewModel.onDataUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    private func fetchArticles() {
        let url = newsType == .business ? NewsApi.businessNewsURL : NewsApi.appleNewsURL
        viewModel.fetchArticles(for: url)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewCell.identifier, for: indexPath) as? NewCell else {
            return UITableViewCell()
        }
        let article = viewModel.articles[indexPath.row]
        cell.configure(with: article)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = viewModel.articles[indexPath.row]
        guard let urlString = article.url, let url = URL(string: urlString) else { return }
        let webVC = WebViewController(url: url)
        navigationController?.pushViewController(webVC, animated: true)
    }
}
