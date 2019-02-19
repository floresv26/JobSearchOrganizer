//
//  TabBarController.swift
//  JobSearchOrganizer
//
//  Created by Vanessa Flores on 2/16/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupViewControllers()
    }
    
    func setupViewControllers() {
        tabBar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        let companiesViewController = UINavigationController(rootViewController: CompaniesViewController())
        companiesViewController.tabBarItem.title = "Companies"
        
        viewControllers = [companiesViewController]
    }
    

}
