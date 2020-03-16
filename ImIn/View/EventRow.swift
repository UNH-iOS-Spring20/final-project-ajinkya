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
        Text(eventItem.name)
    }
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(eventItem: listOfEvents[0])
    }
}
