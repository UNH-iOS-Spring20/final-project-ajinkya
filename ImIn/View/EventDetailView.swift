//
//  EventDetailView.swift
//  ImIn
//
//  Created by Ajinkya Wani on 3/16/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI

struct EventDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    var eventItem: EventDetail
    
    var body: some View {
      
        VStack(alignment: .leading) {
            Text(eventItem.name)
                .font(.title)

            HStack(alignment: .top) {
                Text(eventItem.id)
                    .font(.subheadline)
                Spacer()
                Text(eventItem.vicinity)
                    .font(.subheadline)
            }
            Button(action: addEvent){
                Text("Add Event")
            }
            .padding()
        }
        .padding()
        
    }
    
    func addEvent() {
        print("Adding Event")
       // if !eventItem.name.isEmpty && !eventItem.vicinity {
            let data = ["name": eventItem.name, "vicinity": eventItem.vicinity]
            eventsCollectionRef.addDocument(data: data)
            dismiss()
       // }
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
