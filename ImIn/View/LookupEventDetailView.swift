//
//  LookupEventDetailView.swift
//  ImIn
//
//  Created by Ajinkya Wani on 4/19/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI

struct LookupEventDetailView: View {
    var lookupEvent: LookupEvent
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Image("Event\(lookupEvent.photo)")
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            
            Text(lookupEvent.name)
                .font(.title)
            
            HStack(alignment: .top) {
                Text(lookupEvent.id)
                    .font(.subheadline)
                Spacer()
                Text(lookupEvent.vicinity)
                    .font(.subheadline)
            }
        }
        .padding()
        
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
