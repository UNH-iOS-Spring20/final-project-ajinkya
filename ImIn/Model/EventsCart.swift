//
//  EventsCart.swift
//  ImIn
//
//  Created by Ajinkya Wani on 2/20/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

class EventsCart {
    var cart = [EventItem] ()
    
    func addEvent(event: EventItem) {
        self.cart.append(event)
    }
    
    func getEventsCount() -> Int {
        return self.cart.count
    }
    
}
