//
//  EventRow.swift
//  ImIn
//
//  Created by Ajinkya Wani on 3/16/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI

struct EventRow: View {
    var eventItem: EventDetail
    
    var body: some View {
        PostView(eventItem: eventItem)
    }
}

struct PostView: View {
    var eventItem: EventDetail
    let photo = String(Int.random(in: 1 ..< 6))
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack{
                URLImageView(urlString: eventItem.icon)
                VStack(alignment: .leading, spacing: 4) {
                    Text(eventItem.name)
                        .font(.headline)
                    Text(eventItem.vicinity)
                        .font(.subheadline)
                }.padding(.leading, 8)
            }.padding(.leading, 16).padding(.top, 16)
            
            Image("Event\(photo)")
                .resizable()
                .frame(width: 420, height: 320)
        }.padding(.leading, -20).padding(.bottom, -8)
    }
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(eventItem: listOfEvents[0])
    }
}
