//
//  LookupEventRowView.swift
//  ImIn
//
//  Created by Ajinkya Wani on 4/19/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI

struct LookupEventRowView: View {
    var lookupEvent: LookupEvent
    
    var body: some View {
        LookupPostView(lookupEvent: lookupEvent)
    }
    
} 


struct LookupPostView: View {
    var lookupEvent: LookupEvent
    let photo = String(Int.random(in: 1 ..< 6))
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack{
                URLImageView(urlString: lookupEvent.icon)
                VStack(alignment: .leading, spacing: 4) {
                    Text(lookupEvent.name)
                        .font(.headline)
                    Text(lookupEvent.vicinity)
                        .font(.subheadline)
                }.padding(.leading, 8)
            }.padding(.leading, 16).padding(.top, 16)
            
            Image("Event\(photo)")
                .resizable()
                .frame(width: 420, height: 320)
        }.padding(.leading, -20).padding(.bottom, -8)
    }
}

struct LookupEventRowView_Previews: PreviewProvider {
    static var previews: some View {
        LookupEventRowView(lookupEvent:
            LookupEvent(id: "1", data: ["name": "TestName",
                                        "vicinity": "TestVicinity"])!
        )
    }
}
