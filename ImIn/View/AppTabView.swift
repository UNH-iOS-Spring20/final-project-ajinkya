//
//  AppTabView.swift
//  ImIn
//
//  Created by Ajinkya Wani on 4/25/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import SwiftUI

struct AppTabView: View {
    @EnvironmentObject var session : SessionStore
    
    func getUser(){
        session.listen()
    }
    
    var body: some View {
        Group{
            if (session.session != nil){
                Button(action: session.signOut){
                    Text("Sign Out")
                }
                
                TabView {
                    ContentView()
                        .tabItem {
                            Image(systemName: "list.dash").font(.title)
                            Text("Places")
                    }
                    
                    LookupEventsView()
                        .tabItem {
                            Image(systemName: "car").font(.title)
                            Text("Going")
                    }
                    
                    UserProfileView()
                        .tabItem {
                            Image(systemName: "person.fill").font(.title)
                            Text("Profile")
                    }
                    
                }
                
            }
            else {
                AuthView()
            }
            
        }.onAppear(perform: getUser)
        
    }
}

struct AppTabView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppTabView().environmentObject(SessionStore())
    }
}
