//
//  LoginUser.swift
//  ImIn
//
//  Created by Ajinkya Wani on 2/20/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

class LoginUser {
    var email: String;
    var password: String;
    
    init?(email: String, password: String) {
        if (email.isEmpty || password.isEmpty) {
            return nil;
        }
        self.email = email;
        self.password = password;
    }
}
