//
//  CompaniesViewController.swift
//  JobSearchOrganizer
//
//  Created by Vanessa Flores on 12/28/18.
//  Copyright © 2018 Vanessa Flores. All rights reserved.
//

import UIKit

class CompaniesViewController: UIViewController, UIScrollViewDelegate {
    
    var searchButton: UIBarButtonItem!
    var sortButton: UIBarButtonItem!
    var moreButton: UIBarButtonItem!
//    var containerView: UIView!
    var addCompanyView: AddCompanyView!
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = UIColor.cyan
        return sv
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        view.backgroundColor = UIColor.lightGray
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
        
        setupScrollView()
        
//        setupContainerView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        scrollView.frame = UIScreen.main.bounds
//        containerView.frame = CGRect(x: 0, y: 0, width: scrollView.contentSize.width, height: scrollView.contentSize.height)
//    }
    
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
    
//    func setupContainerView() {
//        containerView = UIView()
////        setupAddCompanyView()
//    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8.0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8.0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        setupAddCompanyView()
    }
    
    func setupAddCompanyView() {
        addCompanyView = AddCompanyView()
        addCompanyView.backgroundColor = UIColor.yellow
        scrollView.addSubview(addCompanyView)
        addCompanyView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: 50)
        
    }
    
//    func setupAddCompanyView() {
//        addCompanyView = AddCompanyView()
//        addCompanyView.backgroundColor = UIColor.lightGray
////        view.addSubview(addCompanyView)
//        containerView.addSubview(addCompanyView)
//        addCompanyView.translatesAutoresizingMaskIntoConstraints = false
//        addCompanyView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
//        addCompanyView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
//        addCompanyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        addCompanyView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//    }
    
    
    
}
