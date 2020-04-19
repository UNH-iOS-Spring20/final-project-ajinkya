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
           Text(lookupEvent.name)
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
