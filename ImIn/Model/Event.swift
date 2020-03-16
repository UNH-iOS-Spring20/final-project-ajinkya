//
//  Event.swift
//  ImIn
//
//  Created by Ajinkya Wani on 3/14/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import Foundation

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
    //var opening_hours: OpeningHours
}

struct OpeningHours: Decodable {
    var open_now: Bool
}
