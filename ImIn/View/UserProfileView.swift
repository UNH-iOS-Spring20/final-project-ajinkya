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
            VStack{
                Image("Display Picture")
                    .resizable()
                    .frame(width: 250, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                
                VStack(alignment: .leading, spacing: 25) {
                    HStack {
                        Text("Name:")
                        Text(user.items[0].firstName)
                        Text(user.items[0].lastName)
                    }
                    HStack {
                        Text("Bio:")
                        Text(user.items[0].bio)
                    }
                    
                }.padding()
                
                VStack (alignment: .center){
                    NavigationLink(destination: EditUserProfileView(user: user.items[0])){
                        Text("Edit Profile")
                    }
                }
                .navigationBarTitle("Profile")
            }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
