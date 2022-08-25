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

    func test_coordinate_shouldCallGeoCoderWithAddress() {
        let geocoderMock = GeoCoderProtocolMock()
        sut.geoCoder = geocoderMock
        let expectedAddress = "Dummy address"
        sut.coordinate(for: expectedAddress) { _ in
        }
        XCTAssertEqual(geocoderMock.gecodeAddressString, expectedAddress, "When setting the coordinate the API client shall pass the address to the GeoCoder.")
    }

    func test_coordinate_fetchesCoordinate() throws {
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
        XCTAssertEqual(geoCoderMock.gecodeAddressString, expectedAddress, "When setting the coordinate the API client shall pass the address to the GeoCoder.")
        XCTAssertEqual(result?.latitude, location.coordinate.latitude, "When setting the address, and a valid coordinate is retreived from the GeoCoder, the API client shall pass the coordinate to the completion handler - latitude.")
        XCTAssertEqual(result?.longitude, location.coordinate.longitude, "When setting the address, and a valid coordinate is retreived from the GeoCoder, the API client shall pass the coordinate to the completion handler - longitude.")
    }

    func test_toDoItems_shouldFetchItems() async throws {
        let url = try XCTUnwrap(URL(string: "http://toodoo.app/items"))
        let urlSessionMock = URLSessionProtocolMock()
        let exptected = [ToDoItem(title: "Dummy title")]
        urlSessionMock.dataForDelegateReturnValue = (
            try JSONEncoder().encode(exptected),
            HTTPURLResponse(url: url, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
        )
        sut.session = urlSessionMock
        let items = try await sut.toDoItems()
        XCTAssertEqual(items, exptected, "The API client shall fetch the ToDo items.")
        XCTAssertEqual(urlSessionMock.dataForDelegateRequest, URLRequest(url: url), "The API client shall use the appropriate URL for the server.")
    }
}
