//
//  SessionStore.swift
//  ImIn
//
//  Created by Ajinkya Wani on 5/8/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI
import Firebase
import Combine
import FirebaseAuth

class SessionStore: ObservableObject {
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: SessionUser? {didSet {self.didChange.send(self) }}
    var handle: AuthStateDidChangeListenerHandle?
    
    func listen () {
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let user = user {
                self.session = SessionUser(uid: user.uid, email: user.email!)
            }else {
                self.session = nil
            }
        })
    }
    
    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback){
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback){
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func signOut() {
        do{
            try Auth.auth().signOut()
            self.session = nil
        }catch {
            print("Error Signing Out")
        }
    }
    
    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
     deinit{
        unbind()
    }
}

struct SessionUser {
    var uid: String
    var email: String?
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
}
