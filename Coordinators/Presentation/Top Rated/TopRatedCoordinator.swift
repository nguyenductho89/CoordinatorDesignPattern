//
//  TopRatedCoordinator.swift
//  Coordinators
//
//  Created by Zafar on 3/16/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit

protocol TopRatedFlow: class {
    func coordinateToDetail()
}

class TopRatedCoordinator: Coordinator, TopRatedFlow {
    
    weak var navigationController: UINavigationController?
    var topRatedDetailCoordinator: TopRatedDetailCoordinator?
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let topRatedViewController = TopRatedViewController()
        topRatedViewController.coordinator = self
        
        navigationController?.pushViewController(topRatedViewController, animated: false)
    }
    
    // MARK: - Flow Methods
    func coordinateToDetail() {
        topRatedDetailCoordinator = TopRatedDetailCoordinator(navigationController: navigationController!)
        coordinate(to: topRatedDetailCoordinator!)
    }
}
