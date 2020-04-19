//
//  LookupEventsView.swift
//  ImIn
//
//  Created by Ajinkya Wani on 4/19/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

let eventsCollectionRef = Firestore.firestore().collection("events2")

struct LookupEventsView: View {
    @ObservedObject private var lookupEvents = FirebaseCollection<LookupEvent>(collectionRef: eventsCollectionRef)
    
    var body: some View {
        VStack {
            List {
                ForEach(lookupEvents.items) { lookupEvent in
                    NavigationLink(destination: LookupEventDetailView(lookupEvent: lookupEvent)) {
                        LookupEventRowView(lookupEvent: lookupEvent)
                    }
                    // Text(event.name)
                }.onDelete(perform: deleteEvent)
            }
        }
        .navigationBarTitle(Text("Lookup Events"))
        .navigationBarItems(leading: EditButton())
    }
    
    func deleteEvent(at offsets: IndexSet) {
        let index = offsets.first!
        print("Deleting lookup event: \(lookupEvents.items[index])")
        let id = lookupEvents.items[index].id
        eventsCollectionRef.document(id).delete() { error in
            if let error = error {
                print("Error removing document: \(error)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    
}

struct LookupEventsView_Previews: PreviewProvider {
    static var previews: some View {
        LookupEventsView()
    }
}
