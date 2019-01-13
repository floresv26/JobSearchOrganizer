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
    var addCompanyView: AddCompanyView!

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
            NSAttributedString.Key.foregroundColor: UIColor.Primary.lightText
        ]
        
        if #available(iOS 11, *) {
            navigationController?.navigationBar.largeTitleTextAttributes = [
                NSAttributedString.Key.font: UIFont(name: "Avenir", size: 34)!,
                NSAttributedString.Key.foregroundColor: UIColor.Primary.lightText
            ]
        }
        
        navigationBarButtons()
        navigationItem.leftBarButtonItem = searchButton
        navigationItem.rightBarButtonItems = [moreButton, sortButton]
        
        setupAddCompanyView()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
    
    func setupAddCompanyView() {
        addCompanyView = AddCompanyView()
//        let navigationBarHeight = navigationController?.navigationBar.frame.height
//        let navigationBarWidth = navigationController?.navigationBar.frame.width
//        addCompanyView.frame = CGRect(x: 0, y: (navigationBarHeight ?? 44) + 20, width: navigationBarWidth ?? UIScreen.main.bounds.width, height: 50)
        addCompanyView.backgroundColor = UIColor.red
        view.addSubview(addCompanyView)
        addCompanyView.translatesAutoresizingMaskIntoConstraints = false
        addCompanyView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        addCompanyView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        addCompanyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        addCompanyView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
