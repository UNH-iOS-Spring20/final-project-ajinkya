//
//  LookupEvent.swift
//  ImIn
//
//  Created by Ajinkya Wani on 4/19/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import Foundation


class LookupEvent: FirebaseCodable {
    
    var id: String
    @Published var name: String
    @Published var vicinity: String
    
    var data: [String: Any] {
        return [
            "name": name,
            "vicinity": vicinity,
        ]
    }
    
    required init?(id: String, data: [String : Any]) {
        guard let name = data["name"] as? String,
            let vicinity = data["vicinity"] as? String
            else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.vicinity = vicinity
    }
}

