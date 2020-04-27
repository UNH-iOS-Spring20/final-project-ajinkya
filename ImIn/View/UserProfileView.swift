//
//  UserProfileView.swift
//  ImIn
//
//  Created by Ajinkya Wani on 4/26/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

let usersCollectionRef = Firestore.firestore().collection("users")

struct UserProfileView: View {
    @ObservedObject private var user = FirebaseCollection<User>(collectionRef: usersCollectionRef)
    
    var body: some View {
        NavigationView{
            Group {
                VStack(spacing: 20) {
                    HStack {
                        Text("First Name:")
                        Text(user.items[0].firstName)
                    }
                    HStack{
                        Text("Last Name:")
                        Text(user.items[0].lastName)
                    }
                    HStack{
                        Text("Address:")
                        Text(user.items[0].address)
                    }
                    HStack{
                        Text("City:")
                        Text(user.items[0].city)
                    }
                    HStack{
                        Text("State:")
                        Text(user.items[0].state)
                    }
                    HStack{
                        Text("Country:")
                        Text(user.items[0].country)
                    }
                    HStack{
                        NavigationLink(destination: EditUserProfileView(user: user.items[0])){
                            Text("Edit")
                        }
                        
                    }
                }
                .navigationBarTitle("User Profile")
            }
            .padding()
        }
        
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
