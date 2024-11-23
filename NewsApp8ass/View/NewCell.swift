//
//  NewCell.swift
//  NewsApp8ass
//
import UIKit
import SnapKit

class NewCell: UITableViewCell {
    static let identifier = "NewCell"

    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor(white: 1.0, alpha: 0.8)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowRadius = 5
        return view
    }()

    private let articleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 2
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 2
        return label
    }()

    private let sourceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        
        backgroundColor = .clear
        contentView.backgroundColor = .clear

        contentView.addSubview(containerView)
        containerView.addSubview(articleImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(sourceLabel)

        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8) 
        }

        articleImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(8)
            make.width.height.equalTo(70)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(articleImageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview().offset(-8)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.trailing.equalTo(titleLabel)
        }

        sourceLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(4)
            make.leading.trailing.equalTo(titleLabel)
            make.bottom.equalToSuperview().offset(-8)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with article: Article) {
        titleLabel.text = article.title
        descriptionLabel.text = article.description ?? "No description available"
        sourceLabel.text = article.source?.name ?? "Unknown Source"

        if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
            loadImage(from: url)
        } else {
            articleImageView.image = UIImage(systemName: "photo")
        }
    }

    private func loadImage(from url: URL) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self?.articleImageView.image = image
            }
        }
        task.resume()
    }
}
