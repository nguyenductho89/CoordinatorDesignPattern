//
//  TabBarCoordinator.swift
//  Coordinators
//
//  Created by Zafar on 3/16/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit

class TabBarCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    private let topRatedNavigationController: UINavigationController = {
        let topRatedNavigationController = UINavigationController()
        topRatedNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        
        return topRatedNavigationController
    }()
    private let searchNavigationController: UINavigationController = {
        let searchNavigationController = UINavigationController()
        searchNavigationController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .search, tag: 1)
        return searchNavigationController
    }()
    private let historyNavigationController: UINavigationController = {
        let historyNavigationController = UINavigationController()
        historyNavigationController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .history, tag: 2)
        return historyNavigationController
    }()
    private lazy var topRatedCoordinator: TopRatedCoordinator = {
        return TopRatedCoordinator(navigationController: self.topRatedNavigationController)
    }()
    private lazy var searchCoordinator: SearchCoordinator = {
        return SearchCoordinator(navigationController: self.searchNavigationController)
    }()
    private lazy var historyCoordinator: HistoryCoordinator = {
        return HistoryCoordinator(navigationController: self.historyNavigationController)
    }()
    
    func start() {
        let tabBarController = TabBarController()
        tabBarController.coordinator = self
        tabBarController.viewControllers = [topRatedNavigationController,
                                            searchNavigationController,
                                            historyNavigationController]
        
        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarController, animated: true, completion: nil)
        
        coordinate(to: topRatedCoordinator)
        coordinate(to: searchCoordinator)
        coordinate(to: historyCoordinator)
    }
}
