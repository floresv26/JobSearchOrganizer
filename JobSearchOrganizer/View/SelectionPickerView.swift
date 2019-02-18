//
//  SelectionPickerView.swift
//  JobSearchOrganizer
//
//  Created by Vanessa Flores on 2/18/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import UIKit

class SelectionPickerView: UIView {
        
    lazy var buttonsView: ButtonsView  = {
        let view = ButtonsView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 160.0)
        translatesAutoresizingMaskIntoConstraints = false
        
        return pickerView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupView() {
//        addSubview(buttonsView)
//        buttonsView.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
//        buttonsView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
//        buttonsView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
//        buttonsView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
        
        addSubview(pickerView)
        pickerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        pickerView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        pickerView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
//        pickerView.heightAnchor.constraint(equalToConstant: 160.0).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

}

class ButtonsView: UIView {
    
    lazy var previousButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.frame = CGRect(x: 0, y: 0, width: 24.0, height: 24.0)
        button.setImage(UIImage(named: "up_arrow.pdf"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.frame = CGRect(x: 0, y: 0, width: 24.0, height: 24.0)
        button.setImage(UIImage(named: "down_arrow.pdf"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.frame = CGRect(x: 0, y: 0, width: 30.0, height: 24.0)
        button.setTitle("Done", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupView() {
        addSubview(previousButton)
        previousButton.widthAnchor.constraint(equalToConstant: 24.0).isActive = true
        previousButton.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
        previousButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16.0).isActive = true
        previousButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8.0).isActive = true
        previousButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8.0).isActive = true
        
        addSubview(nextButton)
        nextButton.widthAnchor.constraint(equalToConstant: 24.0).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
        nextButton.leftAnchor.constraint(equalTo: previousButton.safeAreaLayoutGuide.rightAnchor, constant: 16.0).isActive = true
        nextButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8.0).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8.0).isActive = true

        addSubview(doneButton)
        doneButton.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 24.0).isActive = true
        doneButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16.0).isActive = true
        doneButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8.0).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8.0).isActive = true
        
    }
}
