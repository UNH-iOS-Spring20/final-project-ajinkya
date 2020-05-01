//
//  EventDetailView.swift
//  ImIn
//
//  Created by Ajinkya Wani on 3/16/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI

struct EventDetailView: View {
    @ObservedObject private var lookupEvents = FirebaseCollection<LookupEvent>(collectionRef: eventsCollectionRef)
    @Environment(\.presentationMode) var presentationMode
    @State private var showingEventPresentAlert = false
    var eventItem: EventDetail
    let photo = String(Int.random(in: 1 ..< 6))
    
    var body: some View {
        VStack {
            Image("Event\(photo)")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(eventItem.name)
                .font(.title)
            
            HStack(alignment: .top) {
                Text(eventItem.vicinity)
                    .font(.subheadline)
            }
            Button(action: addEvent){
                Text("Add Event")
            }
            .padding()
        }
        .navigationBarTitle(Text("\(eventItem.name) Details"), displayMode: .inline)
        .alert(isPresented: $showingEventPresentAlert) {
            Alert(title: Text("Event Already Present"), message: Text("This event is already present in your lookup, thank you!"), dismissButton: .default(Text("OK")) {
                self.dismiss()
                })
        }
        
    }
    
    func addEvent() {
        var isPresent: Bool
        isPresent = false
        print("Adding Event")
        for item in lookupEvents.items {
            if item.name == eventItem.name {
                isPresent = true
                self.showingEventPresentAlert.toggle()
            }
            
        }
        if isPresent == false {
            let data = ["name": eventItem.name, "vicinity": eventItem.vicinity, "icon": eventItem.icon,
                        "photo": photo]
            eventsCollectionRef.addDocument(data: data)
            dismiss()
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(eventItem: listOfEvents[0])
    }
}
