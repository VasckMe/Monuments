//
//  MonumentMapAnnotation.swift
//  iOS Code Challenge
//
//  Copyright © 2018 Geektastic. All rights reserved.
//

import Foundation
import MapKit

class MonumentMapAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(monument: Monument) {
        guard
            let latitude = Double(monument.latitude),
            let longitude = Double(monument.longitude)
        else {
            fatalError("Invalid monument data")
        }
        
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.title = monument.name
        self.subtitle = monument.location
    }
    
}
