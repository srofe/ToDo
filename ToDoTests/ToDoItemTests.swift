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

    func test_init_setsTimeStamp() {
        let dummyTimeStamp: TimeInterval = 42.0
        let item = ToDoItem(title: "Dummy", timestamp: dummyTimeStamp)
        XCTAssertEqual(item.timestamp, dummyTimeStamp, "The ToDo shall initialise the timestamp parameter if it is passed by the initialiser.")
    }
}
