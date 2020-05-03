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
    @Published var icon: String
    @Published var photo: String
    @Published var rating: Double
    @Published var latitude: Double
    @Published var longitude: Double
    
    var data: [String: Any] {
        return [
            "name": name,
            "vicinity": vicinity,
        ]
    }
    
    required init?(id: String, data: [String : Any]) {
        guard let name = data["name"] as? String,
            let vicinity = data["vicinity"] as? String,
            let icon = data["icon"] as? String,
            let photo = data["photo"] as? String,
            let rating = data["rating"] as? Double,
            let latitude = data["latitude"] as? Double,
            let longitude = data["longitude"] as? Double
            
            else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.vicinity = vicinity
        self.icon = icon
        self.photo = photo
        self.rating = rating
        self.latitude = latitude
        self.longitude = longitude
    }
}

