//
//  Location.swift
//  ToDo
//
//  Created by Simon Rofe on 27/7/2022.
//

import Foundation

struct Location: Equatable, Codable {
    let name: String
    let coordinate: Coordinate?

    init(name: String, coordinate: Coordinate? = nil) {
        self.name = name
        self.coordinate = coordinate
    }

    static func == (lhs: Location, rhs: Location) -> Bool {
        guard lhs.name == rhs.name else { return false }
        if lhs.coordinate == nil && rhs.coordinate != nil { return false }
        if lhs.coordinate != nil && rhs.coordinate == nil { return false }
        if let lhsCoordinate = lhs.coordinate, let rhsCoordinate = rhs.coordinate {
            if abs(lhsCoordinate.latitude - rhsCoordinate.latitude) > 0.000_000_1 { return false }
            if abs(lhsCoordinate.longitude - rhsCoordinate.longitude) > 0.000_000_1 { return false }
        }
        return true
    }
}
