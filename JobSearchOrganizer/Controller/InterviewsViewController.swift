//
//  InterviewsViewController.swift
//  JobSearchOrganizer
//
//  Created by Vanessa Flores on 12/28/18.
//  Copyright © 2018 Vanessa Flores. All rights reserved.
//

import UIKit

class InterviewsViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = UIColor.gray
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.Primary.primaryBlue
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Interviews Scheduled"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "Avenir", size: 34)!,
            NSAttributedString.Key.foregroundColor: UIColor.Primary.lightText
        ]
        
        if #available(iOS 11, *) {
            navigationController?.navigationBar.largeTitleTextAttributes = [
                NSAttributedString.Key.font: UIFont(name: "Avenir", size: 34)!,
                NSAttributedString.Key.foregroundColor: UIColor.Primary.lightText
            ]
        }
    }
    

    

}
