//
//  AddedEvents.swift
//  ImIn
//
//  Created by Ajinkya Wani on 4/18/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

let pizzeriasCollectionRef = Firestore.firestore().collection("events")

struct AddedEvents: View {
    @ObservedObject private var events = FirebaseCollection<EventTest>(collectionRef: pizzeriasCollectionRef)
    
    var body: some View {
        NavigationView {
            VStack {
//                NavigationLink(destination: AddPizzeriaView()) {
//                    Text("Add Event")
//                }
                List {
                    ForEach(events.items) { event in
                        NavigationLink(destination: EventDetailViewTest(eventItem: event)) {
                            EventRowTest(eventItem: event)
                        }
                       // Text(event.name)
                    }.onDelete(perform: deletePizzeria)
                }
            }
            .navigationBarTitle(Text("Events"))
            .navigationBarItems(leading: EditButton())
        }
    }
    
    func deletePizzeria(at offsets: IndexSet) {
        let index = offsets.first!
        print("Deleting pizzeria: \(events.items[index])")
        let id = events.items[index].id
        pizzeriasCollectionRef.document(id).delete() { error in
            if let error = error {
                print("Error removing document: \(error)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
}

struct AddedEvents_Previews: PreviewProvider {
    static var previews: some View {
        AddedEvents()
    }
}
