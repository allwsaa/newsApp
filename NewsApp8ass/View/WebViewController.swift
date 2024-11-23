//
//  WebViewController.swift
//  NewsApp8ass
//
//  Created by ntvlbl on 23.11.2024.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController {
    private let webView = WKWebView()
    private let url: URL

    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        webView.load(URLRequest(url: url))
    }
}
