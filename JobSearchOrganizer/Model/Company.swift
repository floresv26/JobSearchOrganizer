//
//  Company.swift
//  JobSearchOrganizer
//
//  Created by Vanessa Flores on 2/17/19.
//  Copyright © 2019 Vanessa Flores. All rights reserved.
//

import Foundation

struct Company {
    
    var name: String
    var hasContact: Bool?
    var motivation: Int?
    var currentlyHiring: Int?
    
    var dictionary: [String: Any] {
        return [
            "name": name,
            "hasContact": hasContact ?? false,
            "motivation": motivation ?? 0,
            "currentlyHiring": currentlyHiring ?? 1,
        ]
    }
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, hasContact: Bool?,
         motivation: Int?, currentlyHiring: Int?) {
        self.name = name
    }
    
}

extension Company: DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let name = dictionary["name"] as? String,
            let hasContact = dictionary["hasContact"] as? Bool,
            let motivation = dictionary["motivation"] as? Int,
            let currentlyHiring = dictionary["currentlyHiring"] as? Int else { return nil }
        
        self.init(name: name,
                  hasContact: hasContact,
                  motivation: motivation,
                  currentlyHiring: currentlyHiring)
    }
}
