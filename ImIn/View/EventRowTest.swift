//
//  EventRowTest.swift
//  ImIn
//
//  Created by Ajinkya Wani on 4/18/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI



struct EventRowTest: View {
     var eventItem: EventTest
       
       var body: some View {
           Text(eventItem.name)
       }
}

//struct EventRowTest_Previews: PreviewProvider {
//    static var previews: some View {
//        EventRowTest(eventItem: )
//    }
//}
