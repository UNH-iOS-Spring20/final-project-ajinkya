//
//  LocationManager.swift
//  ImIn
//
//  Created by Ajinkya Wani on 3/16/20.
//  Copyright © 2020 Ajinkya Wani. All rights reserved.
//

import Foundation
import Combine
import CoreLocation

class LocationManager: NSObject, ObservableObject{
  
  @Published var userLatitude: Double = 0
  @Published var userLongitude: Double = 0
  @Published var eventsList = [EventDetail]()
  
  private let locationManager = CLLocationManager()
  
  override init() {
    super.init()
    self.locationManager.delegate = self
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    self.locationManager.requestWhenInUseAuthorization()
    self.locationManager.startUpdatingLocation()
    print("Inside LocationManager constructor")
    let API_KEY = "AIzaSyBI1gYuspytaxVHRAsOf-XV-zMbXBUOxrU"
    
    let resourceString1 = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=1500&type=restaurant&key=\(API_KEY)"
      
      
      guard let resourceURL = URL(string: resourceString1) else {fatalError()}
      
      print(resourceURL)
      
      URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
          guard let data = data else {return}
          do{
          let decoder = JSONDecoder()
          let eventResponse = try decoder.decode(EventResponse.self, from: data)

          DispatchQueue.main.async {
            self.eventsList = eventResponse.results
          }
          }catch {
              print("Error")
          }
      }.resume()

    
  }
}

extension LocationManager: CLLocationManagerDelegate {
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.last else { return }
    userLatitude = location.coordinate.latitude
    userLongitude = location.coordinate.longitude
    
    let API_KEY = "AIzaSyBI1gYuspytaxVHRAsOf-XV-zMbXBUOxrU"
    
      let resourceString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(userLatitude),\(userLongitude)&radius=1500&type=restaurant&keyword=cruise&key=\(API_KEY)"
      
      
      guard let resourceURL = URL(string: resourceString) else {fatalError()}
      
      print(resourceURL)
      
      URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
          guard let data = data else {return}
          do{
          let decoder = JSONDecoder()
          let eventResponse = try decoder.decode(EventResponse.self, from: data)

          DispatchQueue.main.async {
            self.eventsList = eventResponse.results
          }
          }catch {
              print("Error")
          }
      }.resume()
    
  }
}
