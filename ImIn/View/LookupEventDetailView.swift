//
//  LookupEventDetailView.swift
//  ImIn
//
//  Created by Ajinkya Wani on 4/19/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI
import MapKit

struct LookupEventDetailView: View {
    var lookupEvent: LookupEvent
    
    var body: some View {
        
        VStack  {
            MapView(coordinates: CLLocationCoordinate2D(latitude:self.lookupEvent.latitude, longitude: self.lookupEvent.longitude))
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)
            
            Image("Event\(lookupEvent.photo)")
                .resizable()
                .frame(width: 230, height: 230)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            
            VStack(alignment: .leading ) {
                Text(lookupEvent.name)
                    .font(.title)
                HStack {
                    Text(lookupEvent.vicinity)
                        .font(.subheadline)
                    Spacer()
                    Text(String(format: "%.1f", lookupEvent.rating))
                        .font(.subheadline)
                }
            }
            .padding()
        }
        .navigationBarTitle(Text("\(lookupEvent.name) Details"), displayMode: .inline)
    }
}

struct LookupEventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LookupEventDetailView(lookupEvent:
            LookupEvent(id: "1", data: ["name": "TestName",
                                        "vicinity": "TestVicinity"])!
        )
    }
}
