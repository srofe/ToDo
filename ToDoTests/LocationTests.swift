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
}
