//
//  User.swift
//  ImIn
//
//  Created by Ajinkya Wani on 2/19/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

class User {
    var email: String;
    var password: String;
    
    init?(email: String, password: String) {
        if (email.isEmpty) {
            return nil;
        }
        self.email = email;
        self.password = password;
    }
    
}
