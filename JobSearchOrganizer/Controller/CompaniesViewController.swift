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
    
//    let contactPickerViewData : [String:Int] = ["Yes" : 2, "No" : 1]
//    let motivationPickerViewData : [String:Int] = ["Highly motivated" : 5,
//                                                   "Excited" : 4,
//                                                   "Neutral" : 3,
//                                                   "No too excited" : 2,
//                                                   "Don't know anything about them" : 1]
//    let currentlyHiringPickerViewData : [String:Int] = ["Ideal position available" : 3,
//                                                        "Generally hiring" : 2,
//                                                        "Not currently hiring" : 1]
    
    let contactPickerViewData : [Int:String] = [2 : "Yes", 1 : "No"]
    let motivationPickerViewData : [Int:String] = [5 : "Highly motivated",
                                                   4 : "Excited",
                                                   3 : "Neutral",
                                                   2 : "No too excited",
                                                   1 : "Don't know anything about them"]
    let currentlyHiringPickerViewData : [Int:String] = [3 : "Ideal position available",
                                                        2 : "Generally hiring",
                                                        1 : "Not currently hiring"]

    
    var addCompanyView: AddCompanyView!
    var companiesTableView: UITableView!
    var contactsPickerView: SelectionPickerView!
    var motivationPickerView: SelectionPickerView!
    var currentlyHiringPickerView: SelectionPickerView!
    
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
        tabBarController?.tabBar.isTranslucent = false
        
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
            NSAttributedString.Key.foregroundColor: UIColor.Text.white
        ]
        
        if #available(iOS 11, *) {
            navigationController?.navigationBar.largeTitleTextAttributes = [
                NSAttributedString.Key.font: UIFont(name: "Avenir", size: 34)!,
                NSAttributedString.Key.foregroundColor: UIColor.Text.white
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
        
        let company = Company(
            name: validatedText,
            hasContact: 1,
            motivation: 1,
            currentlyHiring: 1
        )
        
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
        companiesTableView.separatorStyle = .none
        query = baseQuery()
    }
    
    func setupView() {
        view.backgroundColor = UIColor.white
        view.addSubview(addCompanyView)
        addCompanyView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        addCompanyView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
        addCompanyView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
        addCompanyView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        view.addSubview(companiesTableView)
        companiesTableView.topAnchor.constraint(equalTo: addCompanyView.safeAreaLayoutGuide.bottomAnchor, constant: 8.0).isActive = true
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
                let company = Company(
                    name: text,
                    hasContact: 1,
                    motivation: 1,
                    currentlyHiring: 1
                )
                
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
        
        cell.selectionStyle = .none
//
//        cell.contactQuestionView.pickerButton.addTarget(self, action: #selector(contactButtonTapped), for: .touchUpInside)
//        cell.motivationQuestionView.pickerButton.addTarget(self, action: #selector(motivationButtonTapped), for: .touchUpInside)
//        cell.hiringQuestionView.pickerButton.addTarget(self, action: #selector(hiringButtonTapped), for: .touchUpInside)

        let company = companies[indexPath.row]
        cell.populate(company: company)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.Background.blue
        } else {
            cell.backgroundColor = UIColor.Background.white
        }
    }
    
//    @objc func contactButtonTapped(_ sender: UIButton) {
//        contactsPickerView = SelectionPickerView()
//        contactsPickerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 160.0)
//        contactsPickerView.backgroundColor = UIColor.Background.gray
//        contactsPickerView.pickerView.dataSource = self
//        contactsPickerView.pickerView.delegate = self
//        contactsPickerView.translatesAutoresizingMaskIntoConstraints = false
//
//        self.view.addSubview(contactsPickerView)
//        contactsPickerView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
//        contactsPickerView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
//        contactsPickerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        contactsPickerView.heightAnchor.constraint(equalToConstant: 160.0).isActive = true
//    }
    
//    @objc func motivationButtonTapped(_ sender: UIButton) {
//        motivationPickerView = SelectionPickerView()
//        motivationPickerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 160.0)
//        motivationPickerView.backgroundColor = UIColor.Background.gray
//        motivationPickerView.pickerView.dataSource = self
//        motivationPickerView.pickerView.delegate = self
//        motivationPickerView.translatesAutoresizingMaskIntoConstraints = false
//
//        self.view.addSubview(motivationPickerView)
//        motivationPickerView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
//        motivationPickerView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
//        motivationPickerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        motivationPickerView.heightAnchor.constraint(equalToConstant: 160.0).isActive = true
//    }
//
//    @objc func hiringButtonTapped(_ sender: UIButton) {
//        currentlyHiringPickerView = SelectionPickerView()
//        currentlyHiringPickerView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 160.0)
//        currentlyHiringPickerView.backgroundColor = UIColor.Background.gray
//        currentlyHiringPickerView.pickerView.dataSource = self
//        currentlyHiringPickerView.pickerView.delegate = self
//        currentlyHiringPickerView.translatesAutoresizingMaskIntoConstraints = false
//
//        self.view.addSubview(currentlyHiringPickerView)
//        currentlyHiringPickerView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
//        currentlyHiringPickerView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
//        currentlyHiringPickerView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        currentlyHiringPickerView.heightAnchor.constraint(equalToConstant: 160.0).isActive = true
//    }
    
}

//extension CompaniesViewController: UIPickerViewDelegate, UIPickerViewDataSource {
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        var numberOfRows: Int = 0
//        if pickerView == contactsPickerView.pickerView {
//            numberOfRows = contactPickerViewData.count
//        } else if pickerView == motivationPickerView.pickerView {
//            numberOfRows = motivationPickerViewData.count
//        } else if pickerView == currentlyHiringPickerView.pickerView {
//            numberOfRows = currentlyHiringPickerViewData.count
//        }
//
//        return numberOfRows
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        if pickerView == contactsPickerView.pickerView {
//            self.view.endEditing(true)
//        } else if pickerView == motivationPickerView.pickerView {
//            pickerView.isHidden = true
//        } else if pickerView == currentlyHiringPickerView.pickerView {
//            pickerView.isHidden = true
//        }
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        var title: String = ""
//        if pickerView == contactsPickerView.pickerView {
//            let data = contactPickerViewData.sorted(by: { $0.key > $1.key })
//            title = data[row].value
//        } else if pickerView == motivationPickerView.pickerView {
//            let data = motivationPickerViewData.sorted(by: { $0.key > $1.key })
//            title = data[row].value
//        } else if pickerView == currentlyHiringPickerView.pickerView {
//            let data = currentlyHiringPickerViewData.sorted(by: { $0.key > $1.key })
//            title = data[row].value
//        }
//
//        return title
//    }
//}

