//
//  TabBarController.swift
//  JobSearchOrganizer
//
//  Created by Vanessa Flores on 12/28/18.
//  Copyright © 2018 Vanessa Flores. All rights reserved.
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
        
        let informationalsViewController = UINavigationController(rootViewController: InformationalsViewController())
        informationalsViewController.tabBarItem.title = "Informationals"
        
        let applicationsViewController = UINavigationController(rootViewController: ApplicationsViewController())
        applicationsViewController.tabBarItem.title = "Applications"
        
        let interviewsViewController = UINavigationController(rootViewController: InterviewsViewController())
        interviewsViewController.tabBarItem.title = "Interviews"
        
        viewControllers = [companiesViewController,
                           informationalsViewController,
                           applicationsViewController,
                           interviewsViewController
        ]
    }
    
    
}
