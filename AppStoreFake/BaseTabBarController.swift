//
//  BaseTabBarController.swift
//  AppStoreFake
//
//  Created by Matheus Damasceno on 06/09/19.
//  Copyright © 2019 Matheus Damasceno. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todayViewController = UIViewController()
        todayViewController.navigationItem.title = "Today"
        todayViewController.view.backgroundColor = .white
        
        let appsViewController = UIViewController()
        appsViewController.view.backgroundColor = .white
        appsViewController.navigationItem.title = "Apps"
        
        let searchViewController = UIViewController()
        searchViewController.view.backgroundColor = .white
        searchViewController.navigationItem.title = "Search"
        
        let appNavController = UINavigationController(rootViewController: appsViewController)
        let searchNavController = UINavigationController(rootViewController: searchViewController)
        let todayNavController = UINavigationController(rootViewController: todayViewController)
        
        
        appNavController.tabBarItem.title = "Apps"
        appNavController.tabBarItem.image = UIImage(named: "apps")
        appNavController.navigationBar.prefersLargeTitles = true
        searchNavController.tabBarItem.title = "Search"
        searchNavController.tabBarItem.image = UIImage(named: "search")
        searchNavController.navigationBar.prefersLargeTitles = true
        todayNavController.navigationBar.prefersLargeTitles = true
        todayNavController.tabBarItem.image = UIImage(named: "today_icon")
        todayNavController.tabBarItem.title = "Today"
        
        viewControllers = [
            todayNavController,
            appNavController,
            searchNavController
        ]
        
    }
}
