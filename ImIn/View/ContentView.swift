//
//  ContentView.swift
//  ImIn
//
//  Created by Ajinkya Wani on 2/16/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI
import FirebaseFirestore


struct ContentView: View{
    
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {
        
                 
            
        NavigationView {
            
            Button(action: {
                    self.getEvents(userLatitude: self.locationManager.userLatitude, userLongitude: self.locationManager.userLongitude)
                }) {
                    Text("Call REST API")
                    .font(.title)
                    }
                    .padding(8.0)
            
            List(listOfEvents, id: \.self) { event in
                       NavigationLink(destination: EventDetailView(eventItem: event)) {
                           EventRow(eventItem: event)
                       }
                   }
                   .navigationBarTitle(Text("Events"))
               }
        
//        VStack {
//            Text("Your location is:")
//            HStack {
//              Text("Latitude: \(locationManager.userLatitude)")
//              Text("Longitude: \(locationManager.userLongitude)")
//            }
//            .padding(8.0)
//
////            Button(action: {
////                self.getEvents(userLatitude: self.locationManager.userLatitude, userLongitude: self.locationManager.userLongitude)
////            }) {
////                Text("Call REST API")
////                    .font(.title)
////            }
////            .padding(8.0)
//
//            }
        }


    private func getEvents(userLatitude: Double, userLongitude: Double) {
    let eventRequest = EventRequest(latitude: userLatitude, longitude: userLongitude)
    eventRequest.getEvents { result in
        switch result{
        case .failure(let error):
            print(error)
        case .success(let events):
            print(listOfEvents)
//            for event in events {
//                //self.listOfEvents.append(event)
//                print(event.name)
//                print(event.vicinity)
//            }
        }
 
    }
    
}

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
