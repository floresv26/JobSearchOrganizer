//
//  SignInViewController.swift
//  JobSearchOrganizer
//
//  Created by Vanessa Flores on 12/6/18.
//  Copyright © 2018 Vanessa Flores. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    lazy var signInView: SignInView = {
        let view = SignInView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(signInView)
        signInView.pinViewToEdges(to: view)
    }
}

extension UIView {
    func pinViewToEdges(to parentView: UIView) {
        leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
    }
}
