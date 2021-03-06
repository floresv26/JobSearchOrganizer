//
//  CompaniesViewController.swift
//  JobSearchOrganizer
//
//  Created by Vanessa Flores on 2/16/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import UIKit
import FirebaseFirestore

class CompaniesViewController: UIViewController {
    
    var addCompanyView: AddCompanyView!
    var companiesTableView: UITableView!
    
    let firestore = Firestore.firestore()
    private var listener: ListenerRegistration?
    
    private var companies: [Company] = []
    private var documents: [DocumentSnapshot] = []
    
    fileprivate var query: Query? {
        didSet {
            if let listener = listener {
                listener.remove()
                observeQuery()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = UIColor.Primary.primaryBlue
        
        edgesForExtendedLayout = []
        
        observeQuery()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isTranslucent = false
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
        
        initializeAddCompanyView()
        initializeCompaniesTableView()
        setupView()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopObserving()
    }
    
    
    // Mark: Set up the view
    
    func initializeAddCompanyView() {
        addCompanyView = AddCompanyView()
        addCompanyView.translatesAutoresizingMaskIntoConstraints = false
        addCompanyView.delegate = self
        addCompanyView.companyNameTextField.delegate = self
        addCompanyView.addCompanyButton.addTarget(self, action: #selector(addCompanyButtonTapped), for: .touchUpInside)
    }
    
    @objc func addCompanyButtonTapped(_ sender: UIButton) {
        guard let validatedText = addCompanyView.companyNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !validatedText.isEmpty else {
            return
        }
        
        let company = Company(name: validatedText)
        
        addCompanyView.resetAddCompanyView()
        addCompanyView.companyNameTextField.resignFirstResponder()
        addCompanyToCollection(company: company)
    }
    
    func initializeCompaniesTableView() {
        companiesTableView = UITableView()
        companiesTableView.translatesAutoresizingMaskIntoConstraints = false
        companiesTableView.delegate = self
        companiesTableView.dataSource = self
        companiesTableView.register(CompaniesTableViewCell.self, forCellReuseIdentifier: "CompaniesTableViewCell")
        query = baseQuery()
    }
    
    func setupView() {
        view.addSubview(addCompanyView)
        addCompanyView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        addCompanyView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        addCompanyView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        addCompanyView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        view.addSubview(companiesTableView)
        companiesTableView.topAnchor.constraint(equalTo: addCompanyView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        companiesTableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        companiesTableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        companiesTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    
    
    
    
    
    // Mark: Firestore queries
    
    fileprivate func stopObserving() {
        listener?.remove()
    }
    
    fileprivate func baseQuery() -> Query {
        return firestore.collection("companies")
    }
    
    fileprivate func observeQuery() {
        guard let query = query else { return }
        stopObserving()
        
        // Display data from Firestore
        listener = query.addSnapshotListener { [unowned self] (snapshot, error) in
            guard let snapshot = snapshot else {
                print("Error fetching snapshot results: \(error!)")
                return
            }
            
            let models = snapshot.documents.map { (document) -> Company in
                if let model = Company(dictionary: document.data()) {
                    return model
                } else {
                    // Don't use fatalError in real app here
                    fatalError("Unable to initialize type \(Company.self) with dictionary \(document.data())")
                }
            }
            self.companies = models
            self.documents = snapshot.documents
            
            self.companiesTableView.reloadData()
        }
    }
    
    deinit {
        listener?.remove()
    }
    
    // Mark: Write to Firestore
    
    func addCompanyToCollection(company: Company) {
        let collection = firestore.collection("companies")
        
        let company = Company(
            name: company.name,
            hasContact: company.hasContact,
            motivation: company.motivation,
            currentlyHiring: company.currentlyHiring
        )

        collection.addDocument(data: company.dictionary)
    }

    // Mark: Read from Firestore
    
    
    

}

// Mark: UITextFieldDelegate

extension CompaniesViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if textField == addCompanyView.companyNameTextField {
            if !text.isEmpty {
                addCompanyView.addCompanyButton.isEnabled = true
            } else {
                addCompanyView.addCompanyButton.isEnabled = false
            }
        }
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == addCompanyView.companyNameTextField {
            guard let validatedText = textField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !validatedText.isEmpty else {
                return false
            }
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == addCompanyView.companyNameTextField {
            textField.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == addCompanyView.companyNameTextField {
            if textField.text != nil, textField.text != "" {
                guard let text = textField.text else {
                    return false
                }
                let company = Company(name: text)
                
                addCompanyView.resetAddCompanyView()
                addCompanyView.companyNameTextField.resignFirstResponder()
                addCompanyToCollection(company: company)
            } 
        }
        return true
    }
}

// Mark: UITableViewDelegate and UITableViewDataSource

extension CompaniesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = companiesTableView.dequeueReusableCell(withIdentifier: "CompaniesTableViewCell", for: indexPath) as! CompaniesTableViewCell
        
        let company = companies[indexPath.row]
        cell.populate(company: company)
        return cell
    }
    
    
}

