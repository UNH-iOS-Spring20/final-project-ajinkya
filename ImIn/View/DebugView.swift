//
//  DebugView.swift
//  ImIn
//
//  Created by Ajinkya Wani on 3/15/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI
import FirebaseFirestore


let db = Firestore.firestore()
//var listOfEvents = [EventDetail]()

struct DebugView: View {
    
    
    var body: some View {
        VStack {
            Button(action: {
                getEvents()
            }) {
                Text("Call REST API")
                    .font(.title)
            }
            .padding(8.0)
            
            HStack{
                Button(action: {
                    createPizzerias()
                }) {
                    Text("Create Events")
                        .font(.title)
                }
                .padding(8.0)
                
                Button(action: {
                   updatePizzerias()
               }) {
                   Text("Update Events")
                       .font(.title)
               }
               .padding(8.0)
            }
                
                Button(action: {
                    deleteCollection(collection: "events")
                }) {
                    Text("Delete All Events")
                        .font(.title)
                }
                .padding(8.0)
                
                Button(action: {
                    getCollection(collection: "events")
                }) {
                    Text("Get All Events")
                        .font(.title)
                }
                .padding(8.0)
            }
        }
}

private func getEvents() {
    let eventRequest = EventRequest()
    eventRequest.getEvents { result in
        switch result{
        case .failure(let error):
            print(error)
        case .success(let events):
            print(events)
        }
 
    }
    
}

private func createPizzerias() {
    let pizzeriasRef = db.collection("events")
    
    pizzeriasRef.document("Cruise Bar").setData([
        "name": "Cruise Bar",
        "address": "New Haven",
        "event type": "Party"
    ])
    
    pizzeriasRef.document("Harbour Cruises").setData([
        "name": "New Haven Harbour Cruises",
        "address": "New Haven",
        "event type": "Party"
    ])
    
    pizzeriasRef.document("Embrace Nature").setData([
        "name": "Embrace Nature",
        "address": "Sydney",
        "event type": "Trekking"
    ])
    
}

private func updatePizzerias() {
    let pizzeriasRef = db.collection("events")
    
     pizzeriasRef.document("Harbour Cruises").setData([
          "name": "West Haven Harbour Cruises",
          "address": "West Haven",
          "event type": "Party"
      ])
      
      pizzeriasRef.document("Embrace Nature").setData([
          "name": "Embrace Nature",
          "address": "East Haven",
          "event type": "Trekking"
      ])
}

private func getCollection(collection: String) {
    db.collection(collection).getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {
                print("\(document.documentID) => \(document.data())")
            }
        }
    }
}

private func deleteCollection(collection: String) {
    db.collection(collection).getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {
                print("Deleting \(document.documentID) => \(document.data())")
                document.reference.delete()
            }
        }
    }
}



struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
    }
}

