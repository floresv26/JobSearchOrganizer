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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    }
    
    func populate(company: Company) {
        nameLabel.text = company.name
    }
    
    

}
