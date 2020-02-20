//
//  NewUser.swift
//  ImIn
//
//  Created by Ajinkya Wani on 2/20/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

class NewUser {
    var name: String
    var email: String
    var password: String
    var confirmPassword: String
    
    init?(name: String, email: String, password: String, confirmPassword: String) {
        if(!password.elementsEqual(confirmPassword) || email.isEmpty || name.isEmpty){
            return nil
        }
        self.name = name;
        self.email = email;
        self.password = password;
        self.confirmPassword = confirmPassword;
    }
    
}
