//
//  EditUserProfileView.swift
//  ImIn
//
//  Created by Ajinkya Wani on 4/26/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI

struct EditUserProfileView: View {
    @ObservedObject var user: User
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Group {
            VStack(spacing: 25) {
                HStack {
                    Text("First Name:")
                        .foregroundColor(Color(.gray))
                    TextField("Enter First Name", text: $user.firstName)
                }
                HStack {
                    Text("Last Name:")
                    .foregroundColor(Color(.gray))
                    TextField("Enter Last Name", text: $user.lastName)
                }
                HStack{
                    Text("Bio:")
                    .foregroundColor(Color(.gray))
                    TextField("Enter Bio", text: $user.bio)
                }
                HStack(alignment: .center){
                    Text("Private Information")
                        .font(.system(size: 16, weight: .bold))
                }
                HStack {
                    Text("Email address:")
                    .foregroundColor(Color(.gray))
                    TextField("Enter Address", text: $user.emailAddress)
                }
                
                //                HStack {
                //                    Text("Phone:")
                //                    TextField("Enter Phone", text: $user.phone)
                //                }
                
                HStack {
                    Text("Address:")
                    .foregroundColor(Color(.gray))
                    TextField("Enter Address", text: $user.address)
                }
                HStack {
                    Text("State:")
                    .foregroundColor(Color(.gray))
                    TextField("Enter State", text: $user.state)
                }
                HStack {
                    Text("Country:")
                    .foregroundColor(Color(.gray))
                    TextField("Enter Country", text: $user.country)
                }
                Button(action: {
                    self.updateUserDetails()
                }) {
                    Text("Save")
                }
                Spacer()
            }
            .navigationBarTitle("Edit \(user.firstName) \(user.lastName) Profile")
            
        }
        .padding()
    }
    
    func updateUserDetails() {
        print("Editing user profile")
        if !user.firstName.isEmpty && !user.lastName.isEmpty && !user.address.isEmpty {
            usersCollectionRef.document(user.id).setData(user.data)
            dismiss()
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct EditUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserProfileView(user: User(id: "1", data: ["firstName": "Test"])!)
    }
}
