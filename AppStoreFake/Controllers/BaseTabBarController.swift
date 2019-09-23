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
        
        viewControllers = [
            createNavController(viewController: UIViewController(), title: "Today", image: "today_icon"),
            createNavController(viewController: UIViewController(), title: "Apps", image: "apps"),
            createNavController(viewController: AppSearchController(), title: "Search", image: "search")
        ]
        
    }
    
    func createNavController(viewController: UIViewController, title: String, image: String) -> UINavigationController {
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: image)
        return navController
    }
}
