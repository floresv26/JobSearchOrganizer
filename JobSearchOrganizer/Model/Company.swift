//
//  Company.swift
//  JobSearchOrganizer
//
//  Created by Vanessa Flores on 2/17/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

struct Company {
    
    var name: String
    var hasContact: Int
    var motivation: Int
    var currentlyHiring: Int
    
    var dictionary: [String: Any] {
        return [
            "name": name,
            "hasContact": hasContact,
            "motivation": motivation,
            "currentlyHiring": currentlyHiring,
        ]
    }
    
//    init(name: String) {
//        self.name = name
//    }
//
//    init(name: String, hasContact: Int?,
//         motivation: Int?, currentlyHiring: Int?) {
//        self.name = name
//    }
    
}

extension Company: DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let name = dictionary["name"] as? String,
            let hasContact = dictionary["hasContact"] as? Int,
            let motivation = dictionary["motivation"] as? Int,
            let currentlyHiring = dictionary["currentlyHiring"] as? Int else { return nil }
        
        self.init(name: name,
                  hasContact: hasContact,
                  motivation: motivation,
                  currentlyHiring: currentlyHiring)
    }
}
