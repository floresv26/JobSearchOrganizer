//
//  CompaniesViewController.swift
//  JobSearchOrganizer
//
//  Created by Vanessa Flores on 2/16/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import UIKit

class CompaniesViewController: UIViewController {
    
    var addCompanyView: AddCompanyView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor.Primary.primaryBlue
        
        edgesForExtendedLayout = []
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
        
        addCompanyView = AddCompanyView()
        addCompanyView.translatesAutoresizingMaskIntoConstraints = false
        
        setupView()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func setupView() {
        view.addSubview(addCompanyView)
        addCompanyView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        addCompanyView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        addCompanyView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        addCompanyView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        print(addCompanyView.frame.origin)
    }

}

