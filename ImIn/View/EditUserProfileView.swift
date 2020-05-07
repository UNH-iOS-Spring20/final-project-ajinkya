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
                    TextField("Enter First Name", text: $user.firstName)
                }
                HStack {
                    Text("Last Name:")
                    TextField("Enter Last Name", text: $user.lastName)
                }
                HStack {
                    Text("Address:")
                    TextField("Enter Address", text: $user.address)
                }
                HStack {
                    Text("City:")
                    TextField("Enter City", text: $user.city)
                }
                HStack {
                    Text("State:")
                    TextField("Enter State", text: $user.state)
                }
                HStack {
                    Text("Country:")
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
