//
//  EventDetailViewTest.swift
//  ImIn
//
//  Created by Ajinkya Wani on 4/18/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI

struct EventDetailViewTest: View {
   var eventItem: EventTest
    
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
        }
        .padding()
        
    }
}

struct EventDetailViewTest_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailViewTest(eventItem:
            EventTest(id: "1", data: ["name": "TestName",
                                      "vicinity": "TestVicinity"])!
        )
    }
}
