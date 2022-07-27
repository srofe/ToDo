//
//  Location.swift
//  ToDo
//
//  Created by Simon Rofe on 27/7/2022.
//

import Foundation
import CoreLocation

struct Location {
    let name: String
    let coordinate: CLLocationCoordinate2D?

    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = ""
        self.coordinate = coordinate
    }
}
