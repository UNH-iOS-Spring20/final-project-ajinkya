//
//  EventRequest.swift
//  ImIn
//
//  Created by Ajinkya Wani on 3/14/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import Foundation


enum EventError: Error {
    case noDataAvailable
    case cannotProcessData
}

var listOfEvents = [EventDetail]()

class EventRequest {
    
   let resourceURL: URL
    //let API_KEY = "AIzaSyBCtGqCSz_kypE2fgfi-oxqJCu_UPI4wUg"
    let API_KEY = "AIzaSyBI1gYuspytaxVHRAsOf-XV-zMbXBUOxrU"
    
    init(latitude: Double, longitude: Double) {
        
        let resourceString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(latitude),\(longitude)&radius=1500&type=restaurant&keyword=cruise&key=\(API_KEY)"
        
        
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
        
        print(resourceURL)
        
//        URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
//            guard let data = data else {return}
//            do{
//            let decoder = JSONDecoder()
//            let eventResponse = try decoder.decode(EventResponse.self, from: data)
//
//            DispatchQueue.main.async {
//                listOfEvents = eventResponse.results
//            }
//            }catch {
//
//            }
//        }.resume()
        
        
    }
    
    func getEvents (completion: @escaping (Result<[EventDetail], EventError>) -> Void){

        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let eventsResponse = try decoder.decode(EventResponse.self, from: jsonData)
                let events = eventsResponse.results
                listOfEvents = events
                completion(.success(events))
            }catch {
                completion(.failure(.cannotProcessData))
            }

        }
        dataTask.resume()
    }
}
