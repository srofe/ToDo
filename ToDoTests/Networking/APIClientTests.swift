//
//  APIClientTests.swift
//  ToDoTests
//
//  Created by Simon Rofe on 16/8/2022.
//

import XCTest
@testable import ToDo
import Intents
import Contacts

class APIClientTests: XCTestCase {
    var sut: APIClient!

    override func setUpWithError() throws {
        sut = APIClient()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_coordinate_fetchesCoordinate() throws {
        try XCTSkipIf(true, "Test to be split into two seperate tests: one for verifying if the method is called with the address string provided, and one for verifying the coordinate is passed into the completion closure.")
        let geoCoderMock = GeoCoderProtocolMock()
        sut.geoCoder = geoCoderMock
        let location = CLLocation(latitude: 1, longitude: 2)
        let placemark = CLPlacemark(location: location, name: nil, postalAddress: nil)
        let expectedAddress = "Dummy address"
        var result: Coordinate?
        sut.coordinate(for: expectedAddress) { coordinate in
            result = coordinate
        }
        geoCoderMock.completionHandler?([placemark], nil)
        XCTAssertEqual(geoCoderMock.gecodeAddressString, expectedAddress)
        XCTAssertEqual(result?.latitude, location.coordinate.latitude)
        XCTAssertEqual(result?.longitude, location.coordinate.longitude)
    }

    func test_coordinate_shouldCallGeoCoderWithAddress() {
        let geocoderMock = GeoCoderProtocolMock()
        sut.geoCoder = geocoderMock
        let expectedAddress = "Dummy address"
        sut.coordinate(for: expectedAddress) { _ in
        }
        XCTAssertEqual(geocoderMock.gecodeAddressString, expectedAddress, "When setting the coordinate the API client shall pass the address to the GeoCoder.")
    }
}
