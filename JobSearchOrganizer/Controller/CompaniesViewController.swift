//
//  CompaniesViewController.swift
//  JobSearchOrganizer
//
//  Created by Vanessa Flores on 12/28/18.
//  Copyright © 2018 Vanessa Flores. All rights reserved.
//

import UIKit

class CompaniesViewController: UIViewController {
    
    var searchButton: UIBarButtonItem!
    var sortButton: UIBarButtonItem!
    var moreButton: UIBarButtonItem!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor.Primary.primaryBlue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Companies"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "Avenir", size: 28)!,
        ]
        
        if #available(iOS 11, *) {
            navigationController?.navigationBar.largeTitleTextAttributes = [
                NSAttributedString.Key.font: UIFont(name: "Avenir", size: 34)!
            ]
        }
        
        navigationBarButtons()
        navigationItem.leftBarButtonItem = searchButton
        navigationItem.rightBarButtonItems = [moreButton, sortButton]
//        navigationItem.setRightBarButtonItems([moreButton, sortButton], animated: true)
    }
    
    func navigationBarButtons() {
        searchButton = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(searchBarButtonPressed))
        searchButton.title = "Search"
        searchButton.tintColor = UIColor.white
        
        sortButton = UIBarButtonItem(image: UIImage(named: "sort_light"), style: .plain, target: self, action: #selector(sortButtonPressed))
        sortButton.tintColor = UIColor.white
        sortButton.title = "Sort"
        
        moreButton = UIBarButtonItem(image: UIImage(named: "more"), style: .plain, target: self, action: #selector(moreButtonPressed))
        moreButton.tintColor = UIColor.white
        moreButton.title = "More"
    }
    
    @objc func searchBarButtonPressed() {
        
    }
    
    @objc func sortButtonPressed() {
        
    }
    
    @objc func moreButtonPressed() {
        
    }
    
}
