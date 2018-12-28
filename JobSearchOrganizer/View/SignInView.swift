//
//  SignInView.swift
//  JobSearchOrganizer
//
//  Created by Vanessa Flores on 12/6/18.
//  Copyright © 2018 Vanessa Flores. All rights reserved.
//

import UIKit
import GoogleSignIn

class SignInView: UIView {
    
//    var googleSignInButton: GIDSignInButton! = GIDSignInButton()
    lazy var googleSignInButton: GIDSignInButton = {
        let button = GIDSignInButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let startFreeTrialButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Start Free Trial", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .yellow
        self.addSubview(googleSignInButton)
        self.addSubview(startFreeTrialButton)
        setupViewLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewLayout() {
        NSLayoutConstraint.activate([
            googleSignInButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            googleSignInButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            startFreeTrialButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            startFreeTrialButton.topAnchor.constraint(equalTo: googleSignInButton.bottomAnchor, constant: 50)
        ])
    }
    
}
