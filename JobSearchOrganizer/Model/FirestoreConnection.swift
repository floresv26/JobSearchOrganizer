//
//  FirestoreConnection.swift
//  JobSearchOrganizer
//
//  Created by Vanessa Flores on 2/25/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum CollectionType: String {
    case companies = "companies"
    case contacts = "contacts"
    case informationalsRequested = "informationalsRequested"
    case reminders = "reminders"
}

class FirestoreConnection {
    
    let firestore = Firestore.firestore()
    private var listener: ListenerRegistration?
    
    private var companies: [Company] = []
    private var documents: [DocumentSnapshot] = []
    
    fileprivate var queryCompanies: Query? {
        didSet {
            if let listener = listener {
                listener.remove()
                observeQuery(for: "companies")
            }
        }
    }
    
    fileprivate func stopObserving() {
        listener?.remove()
    }
    
    fileprivate func baseQuery(for collection: CollectionType.RawValue) -> Query {
        let collection = collection
        
        switch collection {
        case "companies":
            return firestore.collection("companies")
        default:
            return firestore.collection("companies")
        }
    }
    
    fileprivate func observeQuery(for collection: CollectionType.RawValue) {
        let collection = collection
        
        switch collection {
        case "companies":
            guard let query = self.queryCompanies else { return }
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
                
            }
        default:
            print("Error with observeQuery()")
        }
        
        
        
    }
    
    deinit {
        listener?.remove()
    }
}
