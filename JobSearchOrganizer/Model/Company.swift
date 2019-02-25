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
    
    static let contactPickerViewData : [Int:String] = [2 : "Yes", 1 : "No"]
    
    static let motivationPickerViewData : [Int:String] = [5 : "Highly motivated",
                                                          4 : "Excited",
                                                          3 : "Neutral",
                                                          2 : "No too excited",
                                                          1 : "Don't know anything about them"]
    
    static let currentlyHiringPickerViewData : [Int:String] = [3 : "Ideal position available",
                                                               2 : "Generally hiring",
                                                               1 : "Not currently hiring"]
    
    
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
