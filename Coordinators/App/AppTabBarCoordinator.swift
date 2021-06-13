//
//  AppTabBarCoordinator.swift
//  Coordinators
//
//  Created by Nguyễn Đức Thọ on 6/13/21.
//  Copyright © 2021 Zafar. All rights reserved.
//

import UIKit

class AppTabBarCoordinator: Coordinator, HavingKeyWindow {
    private let navigationController = UINavigationController()
    var window: UIWindow
    required init(window: UIWindow) {
        self.window = window
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func start() {
        let tabBarController = TabBarController()
        tabBarController.coordinator = self
        
        let topRatedNavigationController = UINavigationController()
        topRatedNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        let topRatedCoordinator = TopRatedCoordinator(navigationController: topRatedNavigationController)
        
        let searchNavigationController = UINavigationController()
        searchNavigationController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .search, tag: 1)
        let searchCoordinator = SearchCoordinator(navigationController: searchNavigationController)
        
        let historyNavigationController = UINavigationController()
        historyNavigationController.tabBarItem = UITabBarItem(
            tabBarSystemItem: .history, tag: 2)
        let historyCoordinator = HistoryCoordinator(navigationController: historyNavigationController)
        
        tabBarController.viewControllers = [topRatedNavigationController,
                                            searchNavigationController,
                                            historyNavigationController]
        
        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.present(tabBarController, animated: false, completion: nil)
        
        coordinate(to: topRatedCoordinator)
        coordinate(to: searchCoordinator)
        coordinate(to: historyCoordinator)
    }
}
