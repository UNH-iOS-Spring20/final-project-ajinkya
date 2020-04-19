//
//  LookupEventsView.swift
//  ImIn
//
//  Created by Ajinkya Wani on 4/19/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

let eventsCollectionRef = Firestore.firestore().collection("events")

struct LookupEventsView: View {
    @ObservedObject private var events = FirebaseCollection<EventTest>(collectionRef: eventsCollectionRef)
    
    var body: some View {
        VStack {
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
    
    func deletePizzeria(at offsets: IndexSet) {
        let index = offsets.first!
        print("Deleting events: \(events.items[index])")
        let id = events.items[index].id
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
