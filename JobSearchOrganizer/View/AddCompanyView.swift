//
//  AddCompanyView.swift
//  JobSearchOrganizer
//
//  Created by Vanessa Flores on 12/31/18.
//  Copyright © 2018 Vanessa Flores. All rights reserved.
//

import UIKit

class AddCompanyView: UIView {
    
    lazy var addCompanyTextField: UITextField = {
        let addTextField = UITextField()
        addTextField.frame = CGRect(x: 10, y: 10, width: 200, height: 20)
        addTextField.placeholder = "Add a company"
        
        return addTextField
    }()
    
    lazy var addCompanyButton: UIButton = {
        let addButton = UIButton(type: .custom)
        addButton.accessibilityLabel = "Add Company"
        addButton.setImage(UIImage(named: "add_dark"), for: .normal)
        
        return addButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(addCompanyTextField)
        addSubview(addCompanyButton)
    }
    
}
