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
        let companiesViewController = UINavigationController(rootViewController: CompaniesViewController())
        companiesViewController.tabBarItem.title = "Companies"
        
        viewControllers = [companiesViewController]
    }
    

}
