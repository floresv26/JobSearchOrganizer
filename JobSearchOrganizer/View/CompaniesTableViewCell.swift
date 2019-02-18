//
//  CompaniesTableViewCell.swift
//  JobSearchOrganizer
//
//  Created by Vanessa Flores on 2/17/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import UIKit

class CompaniesTableViewCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 17)
        label.textColor = UIColor.Text.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    lazy var contactButton: UIButton = {
//        let button = UIButton(type: UIButton.ButtonType.system)
//        button.setTitle("Do you have a contact?   - Select -", for: .normal)
//        button.setTitleColor(UIColor.Text.lightGray, for: .normal)
//        button.contentHorizontalAlignment = .left
//        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10)
//        button.translatesAutoresizingMaskIntoConstraints = false
//
//        return button
//    }()
    
    lazy var contactQuestionView: QuestionsView = {
        let view = QuestionsView()
        view.questionLabel.text = "Do you have a contact?"
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var motivationQuestionView: QuestionsView = {
        let view = QuestionsView()
        view.questionLabel.text = "How motivated are you to work here?"
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var hiringQuestionView: QuestionsView = {
        let view = QuestionsView()
        view.questionLabel.text = "Are they currently hiring?"
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setupView() {
        addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16.0).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16.0).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        addSubview(contactQuestionView)
        contactQuestionView.topAnchor.constraint(equalTo: nameLabel.safeAreaLayoutGuide.bottomAnchor, constant: 10.0).isActive = true
        contactQuestionView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16.0).isActive = true
        contactQuestionView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16.0).isActive = true
        contactQuestionView.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        addSubview(motivationQuestionView)
        motivationQuestionView.topAnchor.constraint(equalTo: contactQuestionView.safeAreaLayoutGuide.bottomAnchor, constant: 8.0).isActive = true
        motivationQuestionView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16.0).isActive = true
        motivationQuestionView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16.0).isActive = true
        motivationQuestionView.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        addSubview(hiringQuestionView)
        hiringQuestionView.topAnchor.constraint(equalTo: motivationQuestionView.safeAreaLayoutGuide.bottomAnchor, constant: 8.0).isActive = true
        hiringQuestionView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16.0).isActive = true
        hiringQuestionView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16.0).isActive = true
        hiringQuestionView.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
    }
    
    func populate(company: Company) {
        nameLabel.text = company.name
    }

}

class QuestionsView: UIView {
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 15)
        label.textColor = UIColor.Text.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var pickerButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("Select", for: .normal)
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
        addSubview(questionLabel)
        questionLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        questionLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        questionLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        addSubview(pickerButton)
        pickerButton.leftAnchor.constraint(equalTo: questionLabel.safeAreaLayoutGuide.rightAnchor, constant: 16.0).isActive = true
        pickerButton.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        pickerButton.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        pickerButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        
    }
    
}
