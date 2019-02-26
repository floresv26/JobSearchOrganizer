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
        button.isEnabled = false
        button.addTarget(self, action: #selector(addCompanyButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    func setupView() {
        addSubview(addCompanyButton)
        addCompanyButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16.0).isActive = true
        addCompanyButton.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        addCompanyButton.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
        addCompanyButton.widthAnchor.constraint(equalToConstant: 24.0).isActive = true

        addSubview(companyNameTextField)
        companyNameTextField.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16.0).isActive = true
        companyNameTextField.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        companyNameTextField.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        companyNameTextField.widthAnchor.constraint(equalToConstant: 250.0).isActive = true
    }
    
    @objc func addCompanyButtonTapped(_ sender: UIButton) {
        guard let validatedText = companyNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !validatedText.isEmpty else {
            return print("Invalid text entered")
        }
        companyNameTextField.resignFirstResponder()
        companyNameTextField.text = nil
        addCompanyButton.isEnabled = false
        print(validatedText)
    }
    
}
