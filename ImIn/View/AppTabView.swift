//
//  AppTabView.swift
//  ImIn
//
//  Created by Ajinkya Wani on 4/25/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                   // Image(systemName: "list.dash").font(.title)
                    Text("Nearby Events")
            }
            
            LookupEventsView()
                .tabItem {
                   // Image(systemName: "cart").font(.title)
                    Text("Im'IN Events")
            }
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppTabView()
    }
}
