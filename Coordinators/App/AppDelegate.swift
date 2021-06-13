//
//  AppDelegate.swift
//  Coordinators
//
//  Created by Zafar on 3/15/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.start()
        return true
    }
}

extension AppDelegate: Coordinator {
    func start() {
        window = UIWindow()
        let coordinator  = AppCoordinator(window: window!)
        self.coordinate(to: coordinator)
    }
}
