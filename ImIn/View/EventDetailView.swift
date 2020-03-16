//
//  EventDetailView.swift
//  ImIn
//
//  Created by Ajinkya Wani on 3/16/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI

struct EventDetailView: View {
    var eventItem: EventDetail
    
    var body: some View {
        Text(eventItem.name)
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EventDetailView(eventItem: listOfEvents[0])
    }
}
