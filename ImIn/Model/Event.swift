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

struct EventDetail: Decodable, Hashable{
    var name: String
    var vicinity: String
    var rating: Double
    var id: String
    var icon: String
    //var opening_hours: OpeningHours
    var geometry: Geometry
}

struct Geometry: Decodable, Hashable {
    var location: Location
    var viewport: Viewport
}

struct Viewport: Decodable, Hashable{
    var northeast: Location
    var southwest: Location
}

struct Location: Decodable, Hashable {
    var lat: Double
    var lng: Double
}

struct OpeningHours: Decodable {
    var open_now: Bool
}
