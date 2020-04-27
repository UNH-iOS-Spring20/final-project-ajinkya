//
//  User.swift
//  ImIn
//
//  Created by Ajinkya Wani on 4/26/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import Foundation

class User: FirebaseCodable {
    var id: String
    @Published var firstName: String
    @Published var lastName: String
    @Published var address: String
    @Published var city: String
    @Published var state: String
    @Published var country: String
    
    var data: [String: Any] {
        return [
            "firstName": firstName,
            "lastName": lastName,
            "address" : address,
            "city" : city,
            "state" : state,
            "country": country
        ]
    }
    
    required init?(id: String, data: [String : Any]) {
        guard let firstName = data["firstName"] as? String,
            let lastName = data["lastName"] as? String,
            let address = data["address"] as? String,
            let city = data["city"] as? String,
            let state = data["state"] as? String,
            let country = data["country"] as? String
            else {
                return nil
        }
        
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.city = city
        self.state = state
        self.country = country
    }
}
