//
//  ToDoItemTests.swift
//  ToDoItemTests
//
//  Created by Simon Rofe on 27/7/2022.
//

import XCTest
@testable import ToDo

class ToDoItemTests: XCTestCase {
    func test_init_whenGivenTitle_setsTitle() {
        let item = ToDoItem(title: "Dummy")
        XCTAssertEqual(item.title, "Dummy", "The ToDo shall initialise the title parameter to the value passed by the initialiser.")
    }

    func test_init_whenGivenDescription_setsDescription() {
        let item = ToDoItem(title: "Dummy", itemDescription: "Dummy Description")
        XCTAssertEqual(item.itemDescription, "Dummy Description", "The ToDo shall initialise the item description if it is passed by the initialiser.")
    }

    func test_init_whenGivenTimestamp_setsTimeStamp() throws {
        let dummyTimeStamp: TimeInterval = 42.0
        let item = ToDoItem(title: "Dummy", timestamp: dummyTimeStamp)
        let timestamp = try XCTUnwrap(item.timestamp, "The ToDo timestamp parameter shall not be nil if a valid value is passed by the initialiser.")
        XCTAssertEqual(timestamp, dummyTimeStamp, accuracy: 0.000_001, "The ToDo shall initialise the timestamp parameter if it is passed by the initialiser.")
    }

    func test_init_whenGivenLocation_SetsLocation() {
        let dummyLocation = Location(name: "Dummy Name")
        let item = ToDoItem(title: "Dummy Title", location: dummyLocation)
        XCTAssertEqual(item.location?.name, dummyLocation.name, "The ToDo shall initialise the location parameter if it is passed by the initialiser.")
    }

    func test_todoitem_isEquatable_sameNames() {
        let firstItem = ToDoItem(title: "Dummy")
        let secondItem = ToDoItem(title: "Dummy")
        XCTAssertEqual(firstItem, secondItem, "Two ToDo items shall be equal if they have the same title.")
    }
}
