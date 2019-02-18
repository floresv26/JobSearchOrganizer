//
//  AddCompanyView.swift
//  JobSearchOrganizer
//
//  Created by Vanessa Flores on 2/17/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import UIKit

class AddCompanyView: UIView {
    
    weak var delegate: CompaniesViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    lazy var companyNameTextField: TextFieldBorder = {
        let textField = TextFieldBorder()
        textField.frame = CGRect(x: 0, y: 0, width: 250.0, height: 30.0)
        textField.placeholder = "Add a company..."
        textField.font = UIFont(name: "Avenir", size: 17)
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var addCompanyButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setImage(UIImage(named: "add_dark.png"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 24.0, height: 24.0)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    func setupView() {
        backgroundColor = UIColor.white
        addSubview(addCompanyButton)
        addCompanyButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16.0).isActive = true
        addCompanyButton.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        addCompanyButton.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
        addCompanyButton.widthAnchor.constraint(equalToConstant: 24.0).isActive = true
        
        addSubview(companyNameTextField)
        companyNameTextField.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0).isActive = true
        companyNameTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10.0).isActive = true
        companyNameTextField.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10.0).isActive = true
        companyNameTextField.rightAnchor.constraint(equalTo: addCompanyButton.safeAreaLayoutGuide.leftAnchor, constant: -20.0).isActive = true
    }
    
    func resetAddCompanyView() {
        companyNameTextField.text = nil
        addCompanyButton.isEnabled = false
    }
    
}
