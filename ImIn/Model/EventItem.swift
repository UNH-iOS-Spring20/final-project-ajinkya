//
//  EventItem.swift
//  ImIn
//
//  Created by Ajinkya Wani on 2/20/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

class EventItem{
    var eventName: String
    var eventCategory: String
    var place: String
    var location: String
    var images: [String]
    
    init?(eventName: String, eventCategory: String, place: String, location: String, images: [String]) {
        if (eventName.isEmpty || place.isEmpty){
            return nil
        }
        self.eventName = eventName
        self.eventCategory = eventCategory
        self.place = place
        self.location = location
        self.images = images
    }
    
}
