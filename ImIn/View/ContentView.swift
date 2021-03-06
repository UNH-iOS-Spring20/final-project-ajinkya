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
            VStack {
                List(locationManager.eventsList, id: \.self) { event in
                    NavigationLink(destination: EventDetailView(eventItem: event)) {
                        EventRow(eventItem: event)
                    }
                }
            }
            .navigationBarTitle(Text("Places"))
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
