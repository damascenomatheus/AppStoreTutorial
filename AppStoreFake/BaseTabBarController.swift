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
        
        let appsViewController = UIViewController()
        appsViewController.view.backgroundColor = .white
        appsViewController.navigationItem.title = "Apps"
        
        let searchViewController = UIViewController()
        searchViewController.view.backgroundColor = .white
        searchViewController.navigationItem.title = "Search"
        
        let appNavController = UINavigationController(rootViewController: appsViewController)
        let searchNavController = UINavigationController(rootViewController: searchViewController)
        
        appNavController.tabBarItem.title = "Apps"
        appNavController.tabBarItem.image = UIImage(named: "apps")
        appNavController.navigationBar.prefersLargeTitles = true
        searchNavController.tabBarItem.title = "Search"
        searchNavController.tabBarItem.image = UIImage(named: "search")
        searchNavController.navigationBar.prefersLargeTitles = true
        
        
        viewControllers = [
            appNavController,
            searchNavController
        ]
        
    }
}
