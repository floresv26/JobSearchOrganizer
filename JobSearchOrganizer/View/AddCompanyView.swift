//
//  AddCompanyView.swift
//  JobSearchOrganizer
//
//  Created by Vanessa Flores on 12/31/18.
//  Copyright © 2018 Vanessa Flores. All rights reserved.
//

import UIKit

class AddCompanyView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var addCompanyTextField: UITextField = {
        let addTextField = UITextField()
        addTextField.backgroundColor = UIColor.orange
        addTextField.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        addTextField.placeholder = "Add a company"
        addTextField.font = UIFont(name: "Avenir", size: 17)
        addTextField.keyboardType = UIKeyboardType.default
        addTextField.returnKeyType = UIReturnKeyType.done
        addTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        addTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: addTextField.frame.size.height - width,
                              width: addTextField.frame.size.width,
                              height: addTextField.frame.size.height)
        border.borderWidth = width
        addTextField.layer.addSublayer(border)
        addTextField.layer.masksToBounds = true
        
        return addTextField
    }()
    
    lazy var addCompanyButton: UIButton = {
        let addButton = UIButton(type: .custom)
        addButton.backgroundColor = UIColor.brown
        addButton.frame = CGRect(x: 48,
                                 y: 0,
                                 width: 48,
                                 height: 48)
        addButton.accessibilityLabel = "Add Company"
        addButton.setImage(UIImage(named: "add_dark"), for: .normal)
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        
        return addButton
    }()

    
    
    func setupView() {
        addSubview(addCompanyTextField)
//        addCompanyTextField.translatesAutoresizingMaskIntoConstraints = true
//        addCompanyTextField.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        addSubview(addCompanyButton)
//        addCompanyButton.translatesAutoresizingMaskIntoConstraints = false
//        addCompanyButton.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor).isActive = true
//        addCompanyButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    @objc func addButtonPressed() {
        
    }
    
}
