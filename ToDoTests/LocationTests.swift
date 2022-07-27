//
//  LocationTests.swift
//  ToDoTests
//
//  Created by Simon Rofe on 27/7/2022.
//

import XCTest
@testable import ToDo
import CoreLocation

class LocationTests: XCTestCase {
    func test_init_setsCoordinate() throws {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let location = Location(name: "", coordinate: coordinate)
        let resultCoordinate = try XCTUnwrap(location.coordinate, "The Location parameter shall not be nil if a valid location is passed to the initialiser.")
        XCTAssertEqual(resultCoordinate.latitude, 1, accuracy: 0.000_001, "The Location shall initialise the coordinate parameter if passed by the initialiser - latitude.")
        XCTAssertEqual(resultCoordinate.longitude, 2, accuracy: 0.000_001, "The Location shall initialise the coordinate parameter if passed by the initialiser - longitude.")
    }

    func test_init_setsName() {
        let location = Location(name: "Dummy")
        XCTAssertEqual(location.name, "Dummy", "The Location shall initialise the name parameter to the value passed by the initialiser.")
    }

    func test_location_isEquatable_equalLocations() {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let firstLocation = Location(name: "First", coordinate: coordinate)
        let secondLocation = Location(name: "First", coordinate: coordinate)
        XCTAssertEqual(firstLocation, secondLocation, "Two Location's shall be equal if they have the same parameters.")
    }

    func test_location_isEquatable_differentNames() {
        let coordinate = CLLocationCoordinate2D(latitude: 1, longitude: 2)
        let firstLocation = Location(name: "First", coordinate: coordinate)
        let secondLocation = Location(name: "Second", coordinate: coordinate)
        XCTAssertNotEqual(firstLocation, secondLocation, "Two locations shall not be equal if they have different names.")
    }
}
