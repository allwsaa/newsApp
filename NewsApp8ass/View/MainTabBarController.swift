//
//  MainTabBarController.swift
//  NewsApp8ass
//
//  Created by ntvlbl on 23.11.2024.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        setupAppearance()
    }

    private func setupTabs() {
        let businessVC = NewsViewController(newsType: .business)
        let appleVC = NewsViewController(newsType: .apple)

        businessVC.tabBarItem = UITabBarItem(
            title: "Business",
            image: UIImage(systemName: "chart.bar"),
            tag: 0
        )
        appleVC.tabBarItem = UITabBarItem(
            title: "Apple",
            image: UIImage(systemName: "applelogo"),
            tag: 1
        )

        viewControllers = [
            UINavigationController(rootViewController: businessVC),
            UINavigationController(rootViewController: appleVC)
        ]
    }

    private func setupAppearance() {
        tabBar.barTintColor = .darkGray
        tabBar.tintColor = UIColor.white
        tabBar.unselectedItemTintColor = .white
    }
}


enum NewsType {
    case business
    case apple
}
