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

    func testUserInitializationSucceds () {
        let user = User.init(email: "testemail@gmail.com", password: "pass123");
        XCTAssertNotNil(user)
    }
    
    func testUserInitializationFails () {
        let user = User.init(email: "", password: "pass@123")
        XCTAssertNil(user)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
