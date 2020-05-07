//
//  EventDetailView.swift
//  ImIn
//
//  Created by Ajinkya Wani on 3/16/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI
import MapKit

struct EventDetailView: View {
    @ObservedObject private var lookupEvents = FirebaseCollection<LookupEvent>(collectionRef: eventsCollectionRef)
    @Environment(\.presentationMode) var presentationMode
    @State private var showingEventPresentAlert = false
    var eventItem: EventDetail
    let photo = String(Int.random(in: 1 ..< 6))
    
    var body: some View {
        VStack {
            MapView(coordinates: CLLocationCoordinate2D(latitude:self.eventItem.geometry.location.lat, longitude: self.eventItem.geometry.location.lng))
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)
            
            Image("Event\(photo)")
                .resizable()
                .frame(width: 230, height: 230)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            
            VStack(alignment: .leading ) {
                Text(eventItem.name)
                    .font(.title)
                HStack {
                    Text(eventItem.vicinity)
                        .font(.subheadline)
                    Spacer()
                    Text(String(format: "%.1f", eventItem.rating))
                        .font(.subheadline)
                }
            }
            .padding()
            
            Button(action: addEvent){
                Text("Im'IN")
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
                        "photo": photo, "rating": eventItem.rating, "latitude": eventItem.geometry.location.lat,
                        "longitude": eventItem.geometry.location.lng] as [String : Any]
            eventsCollectionRef.addDocument(data: data)
            dismiss()
        }
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct MapView: UIViewRepresentable {
    var coordinates: CLLocationCoordinate2D
    
    func makeUIView(context: Context) ->  MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        view.setRegion(region, animated: true)
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(eventItem: listOfEvents[0])
    }
}
