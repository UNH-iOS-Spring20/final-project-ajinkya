//
//  ImInTests.swift
//  ImInTests
//
//  Created by Ajinkya Wani on 2/16/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import XCTest
@testable import ImIn

class ImInTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: LoginUser Class Tests
    
    func testUserInitializationSucceds () {
        let user = LoginUser.init(email: "testemail@gmail.com", password: "pass123");
        XCTAssertNotNil(user)
    }
    
    func testUserInitializationFails () {
        let user = LoginUser.init(email: "", password: "pass@123")
        XCTAssertNil(user)
        
        let userWithNoPassword = LoginUser.init(email: "test@abc.com", password: "")
        XCTAssertNil(userWithNoPassword)
    }
    
    // MARK: NewUser Class Tests
    
    func testNewUserInitializationFails () {
        let newUser = NewUser.init(name: "Abc", email: "test@abc.com", password: "ab123",
                                   confirmPassword: "ab12")
        XCTAssertNil(newUser)
        
        let newUserWithNoEmail = NewUser.init(name: "aabb", email: "", password: "hello123",
                                              confirmPassword: "hello123")
        XCTAssertNil(newUserWithNoEmail)
        
    }

    func testNewUserInitializationSucceds () {
           let newUser = NewUser.init(name: "Abc", email: "test@abc.com", password: "ab123",
                                      confirmPassword: "ab123")
           XCTAssertNotNil(newUser)
       }
    
    // MARK: EventItem Class Tests
    
    func testEventItemInitializationSucceds () {
        let eventItem = EventItem.init(eventName: "Event 1", eventCategory: "Adventure",
                                       place: "New Haven", location: "", images: ["abc","aabbcc123"])
        XCTAssertNotNil(eventItem)
        
        let eventItem2 = EventItem.init(eventName: "Event 2", eventCategory: "Hiking",
                                            place: "Greater New York Area", location: "adfnj", images: ["abc","aabbcc"])
        XCTAssertNotNil(eventItem2)
    }
    
    func testEventItemInitializationFails () {
        let eventItem = EventItem.init(eventName: "", eventCategory: "Adventure",
                                         place: "New Haven", location: "", images: ["abc","aabbcc123"])
        XCTAssertNil(eventItem)
        
        let eventItemWithNoPlace = EventItem.init(eventName: "Event 11", eventCategory: "Adventure",
                                       place: "", location: "", images: ["abc","aabbcc123"])
        XCTAssertNil(eventItemWithNoPlace)
      }
    
    // MARK: EventCart Class Tests
    
    func testEventsCartAddItem () {
        let eventCart = EventsCart.init()
        XCTAssertEqual(0, eventCart.cart.count)
        
        let eventItem = EventItem.init(eventName: "Event 1", eventCategory: "Adventure",
                                       place: "New Haven", location: "asde", images: ["abc","aabbcc123"])
        eventCart.addEvent(event: eventItem!)
        XCTAssertEqual(1, eventCart.cart.count)
        
        let eventItem2 = EventItem.init(eventName: "Event 2", eventCategory: "Adventure",
                                       place: "Greater New York Area", location: "asde", images: ["abc","aabbcc123"])
        eventCart.addEvent(event: eventItem2!)
        XCTAssertEqual(2, eventCart.cart.count)
        
    }
    
    func testNumberOfEventsInCart () {
        let cart = EventsCart.init()
        let eventItem = EventItem.init(eventName: "Event 1", eventCategory: "Adventure",
        place: "New Haven", location: "asde", images: ["abc","aabbcc123"])
        let eventItem2 = EventItem.init(eventName: "Event 2", eventCategory: "Adventure",
                                        place: "Greater New York Area", location: "asde",
                                        images:["abc","aabbcc123"])
        cart.addEvent(event: eventItem!)
        cart.addEvent(event: eventItem2!)
        XCTAssertEqual(2, cart.getEventsCount())
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
