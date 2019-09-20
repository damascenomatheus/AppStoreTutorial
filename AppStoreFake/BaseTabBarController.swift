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
       
        let todayNavController = createNavController(viewController: ViewController(), title: "Today", backgroundColor: .white, image: "today_icon")
        let appNavController = createNavController(viewController: ViewController(), title: "Apps", backgroundColor: .white, image: "apps")
        let searchNavController = createNavController(viewController: ViewController(), title: "Search", backgroundColor: .white, image: "search")
        
        viewControllers = [
            todayNavController,
            appNavController,
            searchNavController
        ]
        
    }
    
    func createNavController(viewController: UIViewController, title: String, backgroundColor: UIColor, image: String) -> UINavigationController {
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = backgroundColor
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: image)
        return navController
    }
}
