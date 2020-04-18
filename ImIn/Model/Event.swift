//
//  Event.swift
//  ImIn
//
//  Created by Ajinkya Wani on 3/14/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct EventResponse: Decodable{
    var results: [EventDetail]
}

/*struct Events: Decodable {
    var events: [EventDetail]
}*/

struct EventDetail: Decodable, Hashable{
    var name: String
    var vicinity: String
    //var rating: Int
    var id: String
    //var opening_hours: OpeningHours
}

struct OpeningHours: Decodable {
    var open_now: Bool
}



class EventTest: FirebaseCodable {
    
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
