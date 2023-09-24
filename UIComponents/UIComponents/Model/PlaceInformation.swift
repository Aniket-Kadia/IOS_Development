//
//  PlaceInformation.swift
//  UIComponents
//
//  Created by Aniket Kadia on 24/05/23.
//

import Foundation
import CoreLocation
struct PlaceInformation {
    let placeName: String
    let coordinateOfPlace: CLLocationCoordinate2D
    let annotationTitle: String
    static func getPlaceWithCoordinates() -> [PlaceInformation] {
        return [PlaceInformation(placeName: "Home", coordinateOfPlace: CLLocationCoordinate2D(latitude: 23.0792982, longitude: 72.5677234),annotationTitle: "Your Home"),
                PlaceInformation(placeName: "College", coordinateOfPlace: CLLocationCoordinate2D(latitude: 23.2587921, longitude: 72.6504921),annotationTitle: "GEC Gandhinagar"),
                PlaceInformation(placeName: "Simform", coordinateOfPlace: CLLocationCoordinate2D(latitude: 23.028089, longitude: 72.499372),annotationTitle: "Simform Solutions")
        ]
    }
}
