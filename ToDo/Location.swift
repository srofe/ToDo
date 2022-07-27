//
//  Location.swift
//  ToDo
//
//  Created by Simon Rofe on 27/7/2022.
//

import Foundation
import CoreLocation

struct Location: Equatable {
    let name: String
    let coordinate: CLLocationCoordinate2D?

    init(name: String, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.coordinate = coordinate
    }

    static func == (lhs: Location, rhs: Location) -> Bool {
        guard lhs.name == rhs.name else { return false }
        guard lhs.coordinate?.latitude == rhs.coordinate?.latitude else { return false }
        guard lhs.coordinate?.longitude == rhs.coordinate?.longitude else { return false }
        if lhs.coordinate == nil && rhs.coordinate != nil { return false }
        if lhs.coordinate != nil && rhs.coordinate == nil { return false }
        return true
    }
}
