//
//  MapCourseLocation.swift
//  SwiftfulMapApp
//
//  Created by Nick Sarno on 11/27/21.
//

import Foundation
import MapKit

struct MapCourseLocation: Identifiable, Equatable {
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    // Identifiable
    var id: String {
        // name = "Colosseum"
        // cityName = "Rome"
        // id = "ColosseumRome"
        name + cityName
    }
    
    // Equatable
    static func == (lhs: MapCourseLocation, rhs: MapCourseLocation) -> Bool {
        lhs.id == rhs.id
    }

}
