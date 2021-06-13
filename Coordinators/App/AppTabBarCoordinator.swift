//
//  AppTabBarCoordinator.swift
//  Coordinators
//
//  Created by Nguyễn Đức Thọ on 6/13/21.
//  Copyright © 2021 Zafar. All rights reserved.
//

import UIKit

class AppTabBarCoordinator: Coordinator, HavingKeyWindow {
    var window: UIWindow
    required init(window: UIWindow) {
        self.window = window
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
    
    private let tabBarController = TabBarController()
    
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
        tabBarController.coordinator = self
        tabBarController.viewControllers = [topRatedNavigationController,
                                            searchNavigationController,
                                            historyNavigationController]
        coordinate(to: topRatedCoordinator)
        coordinate(to: searchCoordinator)
        coordinate(to: historyCoordinator)
    }
}
