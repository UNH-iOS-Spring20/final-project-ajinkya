//
//  ContentView.swift
//  ImIn
//
//  Created by Ajinkya Wani on 2/16/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI
import FirebaseFirestore


//let db = Firestore.firestore()
//var listOfEvents = [EventDetail]()

struct ContentView: View {
    
    var body: some View {
        VStack {
            Button(action: {
                self.getEvents()
            }) {
                Text("Call REST API")
                    .font(.title)
            }
            .padding(8.0)
         
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

}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
